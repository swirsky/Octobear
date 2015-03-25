class AddAndRemoveIndexes < ActiveRecord::Migration
  def change
    remove_index :factions, [:campaign_id, :main_type]
    add_index :factions, :campaign_id
    add_index :factions, :location_id
    add_index :npcs, :location_id
    remove_index :npc_relations, [:npc1_id, :npc2_id, :campaign_id]
    add_index :npc_relations, :campaign_id
    add_index :npc_relations, [:npc1_id, :npc2_id]
    add_index :locations, :parent_id
  end
end
