require "spec_helper"

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

  end
end

