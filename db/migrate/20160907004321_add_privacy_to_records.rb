class AddPrivacyToRecords < ActiveRecord::Migration
  def change
    #add is_public col to all models
    #only public models will be viewable by players
    add_column :allegiances, :campaign_id, :integer
    add_column :allegiances, :is_public, :boolean
    add_column :factions, :is_public, :boolean
    add_column :locations, :is_public, :boolean
    add_column :npcs, :is_public, :boolean
    add_column :npc_relations, :is_public, :boolean
  end
end
