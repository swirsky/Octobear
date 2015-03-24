class CreateNpcs < ActiveRecord::Migration
  def change
    create_table :npcs do |t|
      t.string :name, null:false
      t.integer :campaign_id, null:false
      t.string :description
      t.string :race
      t.string :gender
      t.string :location
      t.string :notes
      t.string :influence
      t.string :strength

      t.timestamps null: false
    end
  end
end
