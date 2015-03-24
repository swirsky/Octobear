class Npc < ActiveRecord::Base
  include CampaignHelper

  belongs_to :campaign
  has_many :npc_relations
  validates_presence_of :name, :campaign_id

  def self.import(file, campaign_id)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      npc = find_by_id(row["id"]) || new
      npc.attributes = row.to_hash.slice(*accessible_attributes)
      npc.campaign_id = campaign_id
      npc.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << npc.attributes.values_at(*column_names)
      end
    end
  end

end