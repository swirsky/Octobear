class Allegiance < ActiveRecord::Base

  belongs_to :faction
  belongs_to :npc

  def get_friend(list_name)
    case list_name
    when "Faction"
      self.faction.name
    when "NPC"
      self.npc.name
    end
  end

  def self.import_allegiance_job(campaign)
    campaign.factions.each do |f|
      if f.leader_id && !Allegiance.find_by(faction_id:f.id, npc_id:f.leader_id)
        Allegiance.create(
          faction_id:f.id,
          npc_id:f.leader_id
        )
      end
    end
  end

end
