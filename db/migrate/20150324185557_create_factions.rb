class CreateFactions < ActiveRecord::Migration
  def change
    create_table :factions do |t|
      t.string :name, null:false
      t.integer :campaign_id, null:false
      t.integer :leader_id
      t.string :description
      t.string :type
      t.string :subtype
      t.string :headquarters
      t.string :influence
      t.string :strength
      t.boolean :secret

      t.timestamps null: false
    end
  end
end
