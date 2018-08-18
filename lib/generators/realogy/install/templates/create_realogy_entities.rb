class CreateRealogyEntities < ActiveRecord::Migration[5.2]
  def change
    create_table :realogy_entities do |t|
      t.string :type
      t.string :entity_id
      t.datetime :last_update_on
      t.json :data

      t.timestamps
    end
    add_index :realogy_entities, :type
    add_index :realogy_entities, :entity_id
    add_index :realogy_entities, :last_update_on
  end
end
