require 'roo'

class Npc < ActiveRecord::Base
  include CampaignsHelper

  scope :public_knowledge, -> { where(is_public: true) }

  belongs_to :campaign
  has_many :npc_relations, dependent: :destroy
  has_many :allegiances, dependent: :destroy
  belongs_to :location
  has_many :factions, through: :allegiances
  validates_presence_of :name, :campaign_id

  before_save :check_location

  def npc_relations
    NpcRelation.where(npc1_id:self.id) + NpcRelation.where(npc2_id:self.id)
  end

  def self.import(file, campaign_id)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      npc = find_by_id(row["id"]) || new
      npc.attributes = row.to_hash.slice(*row.to_hash.keys)
      npc.campaign_id = campaign_id
      npc.save!
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |npc|
        csv << npc.attributes.values_at(*column_names)
      end
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

  private

  def check_location
    loc = nil
    loc = Location.find_by(id:self.location_id) if self.location_id
    loc = Location.find_by(name:self.location_name, campaign_id:self.campaign_id) if !loc && self.location_name
    if loc
      self.location_name = loc.name
    else
      self.location_id = nil
    end
  end
end
