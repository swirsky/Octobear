class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null:false
      t.integer :campaign_id, null:false
      t.string :description
      t.string :notes

      t.timestamps null: false
    end

    rename_column :npcs, :location, :location_name
    add_column :factions, :location_id, :integer
    add_column :npcs, :location_id, :integer
    add_index :locations, :name
  end
end
