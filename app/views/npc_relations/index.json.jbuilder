json.array!(@npc_relations) do |npc_relation|
  json.extract! npc_relation, :id, :campaign_id, :npc1_id, :npc2_id, :status, :notes
  json.url npc_relation_url(npc_relation, format: :json)
end
