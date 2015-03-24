json.array!(@factions) do |faction|
  json.extract! faction, :id, :name, :campaign_id, :leader_id, :description, :type, :subtype, :headquarters, :influence, :strength, :secret
  json.url faction_url(faction, format: :json)
end
