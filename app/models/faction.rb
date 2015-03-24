class Faction < ActiveRecord::Base

  validates_presence_of :name, :campaign_id

  belongs_to :campaign

  def self.import(file, campaign_id)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      faction = find_by_id(row["id"]) || new
      faction.attributes = row.to_hash.slice(*accessible_attributes)
      faction.campaign_id = campaign_id
      faction.leader_id = faction.leader_id || find_possible_leader(row["name"])
      faction.save!
    end
  end

  def leader
    self.leader_id ? NPC.find(self.leader_id) : nil
  end

  def leader_name
    self.leader ? self.leader.name : ""
  end

  def find_possible_leader(name)
    if NPC.find_by(name:name, campaign_id:self.campaign_id)
      return NPC.find_by(name:name, campaign_id:self.campaign_id).id
    else
      return nil
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
        csv << faction.attributes.values_at(*column_names)
      end
    end
  end
end
