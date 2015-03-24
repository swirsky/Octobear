class CreateNpcRelations < ActiveRecord::Migration
  def change
    create_table :npc_relations do |t|
      t.integer :campaign_id, null:false
      t.integer :npc1_id, null:false
      t.integer :npc2_id, null:false
      t.string :status, null:false, default:"Neutral"
      t.string :notes

      t.timestamps null: false
    end
  end
end
