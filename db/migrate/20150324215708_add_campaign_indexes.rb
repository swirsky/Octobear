class AddCampaignIndexes < ActiveRecord::Migration
  def change
    add_index :allegiances, [:npc_id, :faction_id]
    add_index :factions, [:campaign_id, :main_type]
    add_index :npcs, [:campaign_id]
    add_index :npc_relations, [:npc1_id, :npc2_id, :campaign_id]
  end
end
