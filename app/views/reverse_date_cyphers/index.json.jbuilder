json.array!(@reverse_date_cyphers) do |reverse_date_cypher|
  json.extract! reverse_date_cypher, :id, :input, :date_cypher, :output
  json.url reverse_date_cypher_url(reverse_date_cypher, format: :json)
end
