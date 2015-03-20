json.array!(@rot_cyphers) do |rot_cypher|
  json.extract! rot_cypher, :id, :input, :user_id, :rot, :output
  json.url rot_cypher_url(rot_cypher, format: :json)
end
