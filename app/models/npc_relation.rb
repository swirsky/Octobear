class NpcRelation < ActiveRecord::Base
  validates_presence_of :campaign_id, :npc1_id, :npc2_id, :status

  def npc1
    NPC.find_by(id:self.npc1_id)
  end

  def npc2
    NPC.find_by(id:self.npc2_id)
  end

  def other_npc(npc)
    [npc1, npc2] - npc
  end
end
