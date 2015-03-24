class Campaign < ActiveRecord::Base

  validates_presence_of :name, :user_id

  has_many :npcs
  has_many :factions

end
