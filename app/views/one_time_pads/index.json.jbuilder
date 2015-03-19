json.array!(@one_time_pads) do |one_time_pad|
  json.extract! one_time_pad, :id, :input, :cypher, :output, :line_length, :group_length, :number_of_keys, :key_length, :seed
  json.url one_time_pad_url(one_time_pad, format: :json)
end
