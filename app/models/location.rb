class Location < ActiveRecord::Base
  validates_presence_of :name, :campaign_id
  belongs_to :campaign
  has_many :factions
  has_many :npcs

  def parent
    Location.find_by(id:self.parent_id)
  end

  def sublocation
    !!self.parent_id
  end
end
