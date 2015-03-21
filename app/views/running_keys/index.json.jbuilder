json.array!(@running_keys) do |running_key|
  json.extract! running_key, :id, :user_id, :input, :group_length, :indicator_block, :output, :running_key
  json.url running_key_url(running_key, format: :json)
end
