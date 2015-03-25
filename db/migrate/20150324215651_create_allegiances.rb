class CreateAllegiances < ActiveRecord::Migration
  def change
    create_table :allegiances do |t|
      t.integer :npc_id, null:false
      t.integer :faction_id, null:false
      t.string :status
      t.string :notes
      t.timestamps null: false
    end
  end
end
