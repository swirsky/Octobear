require 'roo'

class Faction < ActiveRecord::Base

  scope :public_knowledge, -> { where(is_public: true) }

  validates_presence_of :name, :campaign_id

  belongs_to :campaign
  has_many :allegiances, dependent: :destroy
  belongs_to :location
  has_many :npcs, through: :allegiances

  before_save :check_location

  def self.import(file, campaign_id)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      faction = find_by_id(row["id"]) || new
      faction.campaign_id = campaign_id
      leader_id = faction.find_leader(row["leader"])
      keys = row.to_hash.keys
      keys.delete("leader")
      faction.attributes = row.to_hash.slice(*keys)
      faction.leader_id = leader_id
      faction.save!
    end
  end

  def leader
    self.leader_id ? Npc.find(self.leader_id) : nil
  end

  def leader_name
    self.leader ? self.leader.name : ""
  end

  def find_leader(name=nil)
    if name && Npc.find_by(name:name, campaign_id:self.campaign_id)
      return Npc.find_by(name:name, campaign_id:self.campaign_id).id
    elsif self.leader
      return self.leader.id
    else
      return nil
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |faction|
        csv << faction.attributes.values_at(*column_names)
      end
    end
  end

  def check_location
    loc = nil
    loc = Location.find_by(id:self.location_id) if self.location_id
    loc = Location.find_by(name:self.headquarters, campaign_id:self.campaign_id) if !loc && self.headquarters
    if loc
      self.headquarters_name = loc.name
    else
      self.location_id = nil
    end
  end
end
