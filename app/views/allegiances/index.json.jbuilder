json.array!(@allegiances) do |allegiance|
  json.extract! allegiance, :id
  json.url allegiance_url(allegiance, format: :json)
end
