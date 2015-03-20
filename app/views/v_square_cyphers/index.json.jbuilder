json.array!(@v_square_cyphers) do |v_square_cypher|
  json.extract! v_square_cypher, :id, :input, :user_id, :output, :codeword
  json.url v_square_cypher_url(v_square_cypher, format: :json)
end
