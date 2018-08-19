require "spec_helper"

module Realogy
  describe Listing do

    before :each do
      ActiveRecord::Base.establish_connection(
        adapter: 'sqlite3',
        database: ':memory:'
      )

      ActiveRecord::Schema.define do
        create_table :realogy_entities, force: true do |t|
          t.string :type
          t.string :entity_id
          t.datetime :last_update_on
          t.text :data
        end
      end
    end
 
     describe ".new" do
      it "Returns a Realogy::Listing instance" do
        expect(Realogy::Listing.new).to be_a(Realogy::Listing)
      end

      it "Realogy::Listing without entity_id is invalid" do
        expect(Realogy::Listing.new(last_update_on: DateTime.now).valid?).to be_falsey
      end

      it "Realogy::Listing without last_update_on is invalid" do
        expect(Realogy::Listing.new(entity_id: "0123456789").valid?).to be_falsey
      end

      it "Realogy::Listing with both entity_id and last_update_on is valid" do
        expect(Realogy::Listing.new(entity_id: "0123456789", last_update_on: DateTime.now).valid?).to be_truthy
      end

    end

  end
end

