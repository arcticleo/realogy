require "spec_helper"

RSpec.describe Realogy do

  describe "Checking status" do
    it "Has a version number" do
      expect(Realogy::VERSION).not_to be nil
    end

    it "Is a Module" do
      expect(Realogy).to be_a(Module)
    end
  end

end

