class Location < ActiveRecord::Base
  
  scope :public_knowledge, -> { where(is_public: true) }

  validates_presence_of :name, :campaign_id
  belongs_to :campaign
  has_many :locations
  has_many :npcs

  def parent
    Location.find_by(id:self.parent_id)
  end

  def sublocation
    !!self.parent_id
  end

  def find_parent_id(name)
    p = Location.find_by(name:name, campaign_id:self.campaign_id)
    return p ? p.id : nil
  end

  def self.import(file, campaign_id)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      location = find_by_id(row["id"]) || new
      location.campaign_id = campaign_id
      parent_location = location.find_parent(row["parent"])
      keys = row.to_hash.keys
      keys.delete("parent")
      location.attributes = row.to_hash.slice(*keys)
      location.parent_id = parent_location
      location.save!
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
      all.each do |location|
        csv << location.attributes.values_at(*column_names)
      end
    end
  end
end
