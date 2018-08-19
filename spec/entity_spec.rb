require "spec_helper"

module Realogy
  describe Entity do

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
      let(:entity) { Realogy::Entity.new }
      let(:invalid) { Realogy::Entity.new.valid? }
      let(:valid_subclass) { Realogy::Entity.new(type: "Realogy::Agent", entity_id: "0123456789", last_update_on: DateTime.now).valid? }
      let(:invalid_subclass) { Realogy::Entity.new(type: "Realogy::Elephant", entity_id: "0123456789", last_update_on: DateTime.now) }

      it "Returns a Realogy::Entity instance" do
        expect(entity).to be_a(Realogy::Entity)
      end

      it "Realogy::Entity without type is invalid" do
        expect(invalid).to be_falsey
      end

      it "Realogy::Entity with a valid subclass type is valid" do
        expect(valid_subclass).to be_truthy
      end

      it "Realogy::Entity with an invalid subclass type raises error" do
        expect{invalid_subclass}.to raise_error(ActiveRecord::SubclassNotFound)
      end
    end

  end
end

