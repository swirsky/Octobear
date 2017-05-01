class Campaign < ActiveRecord::Base

  validates_presence_of :name, :user_id

  has_many :npcs
  has_many :npc_relations, through: :npcs
  has_many :factions
  has_many :locations
  has_many :allegiances

  def accessible_npcs(user)
    if gm?
      npcs
    else
      npcs.public_knowledge
    end
  end

  def accessible_npc_relations(user)
    if gm?
      npc_relations.uniq
    else
      npc_relations.public_knowledge.uniq
    end
  end

  def accessible_factions(user)
    if gm?
      factions
    else
      factions.public_knowledge
    end
  end

  def accessible_locations(user)
    if gm?
      locations
    else
      locations.public_knowledge
    end
  end

  def accessible_allegiances(user)
    if gm?
      allegiances
    else
      allegiances.public_knowledge
    end
  end

  def gm?(user)
    user_id == user.id
  end

end
