json.array!(@npcs) do |npc|
  json.extract! npc, :id, :name, :campaign_id, :description, :race, :gender, :location, :notes, :influence, :strength
  json.url npc_url(npc, format: :json)
end
