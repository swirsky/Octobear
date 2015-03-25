class Location < ActiveRecord::Base
  validates_presence_of :name, :campaign_id
  has_many :factions
  has_many :npcs
end
