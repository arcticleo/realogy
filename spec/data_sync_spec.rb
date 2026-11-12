require "spec_helper"
require "net/http"
require "ostruct"

module Realogy

  describe DataSync do
    describe ".client" do
      let(:client) { Realogy::DataSync.client }

      it "Returns a DataSync client" do
        expect(client).to be_a(Realogy::DataSync)
      end
    end

    describe ".new" do
      it "Singleton raises error" do
        expect{Realogy::DataSync.new}.to raise_error(NoMethodError)
      end
    end

    describe "#perform_api_call" do
      let(:client) { Realogy::DataSync.client }

      let(:ok_response) do
        Net::HTTPSuccess.new(nil, 200, "OK").tap do |resp|
          allow(resp).to receive(:body).and_return('{"data":[]}')
        end
      end

      let(:fake_http) do
        Class.new do
          attr_accessor :open_timeout, :read_timeout, :write_timeout, :ssl_timeout, :max_retries

          def initialize(script)
            @script = script
            @idx = 0
          end

          def request(_req)
            resp = @script[@idx]
            @idx += 1
            raise resp if resp.is_a?(Exception)
            resp
          end
        end
      end

      before do
        allow(client).to receive(:auth_token).and_return("test-token")
        credentials = double("credentials")
        allow(credentials).to receive(:dig).and_return("https://api.realogy.test/api", "sub-key")
        allow(Rails.application).to receive(:credentials).and_return(credentials)
      end

      it "retries once on Net::ReadTimeout and returns the response" do
        calls = 0
        scripts = [[Net::ReadTimeout.new, ok_response], [ok_response]]
        allow(Net::HTTP).to receive(:start) do |_host, _port, **_opts, &blk|
          http = fake_http.new(scripts[calls])
          calls += 1
          blk.call(http)
        end

        expect(client.send(:perform_api_call, "agents/active", nil)).to eq("data" => [])
        # 2 Net::HTTP.start entries = one original attempt plus one retry
        expect(calls).to eq(2)
      end

      it "propagates the exception on the second timeout" do
        calls = 0
        scripts = [[Net::ReadTimeout.new, Net::ReadTimeout.new], [Net::OpenTimeout.new]]
        allow(Net::HTTP).to receive(:start) do |_host, _port, **_opts, &blk|
          http = fake_http.new(scripts[calls])
          calls += 1
          blk.call(http)
        end

        expect { client.send(:perform_api_call, "agents/active", nil) }.to raise_error(Net::OpenTimeout)
        expect(calls).to eq(2)
      end

      it "makes a single attempt when no timeout occurs" do
        calls = 0
        scripts = [[ok_response]]
        allow(Net::HTTP).to receive(:start) do |_host, _port, **_opts, &blk|
          http = fake_http.new(scripts[calls])
          calls += 1
          blk.call(http)
        end

        expect(client.send(:perform_api_call, "agents/active", nil)).to eq("data" => [])
        expect(calls).to eq(1)
      end
    end

  end
end
