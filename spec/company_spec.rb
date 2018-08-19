require "spec_helper"

module Realogy
  describe Company do

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
      it "Returns a Realogy::Company instance" do
        expect(Realogy::Company.new).to be_a(Realogy::Company)
      end

      it "Realogy::Company without entity_id is invalid" do
        expect(Realogy::Company.new(last_update_on: DateTime.now).valid?).to be_falsey
      end

      it "Realogy::Company without last_update_on is invalid" do
        expect(Realogy::Company.new(entity_id: "0123456789").valid?).to be_falsey
      end

      it "Realogy::Company with both entity_id and last_update_on is valid" do
        expect(Realogy::Company.new(entity_id: "0123456789", last_update_on: DateTime.now).valid?).to be_truthy
      end

    end

  end
end

