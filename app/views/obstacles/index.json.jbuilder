json.array!(@obstacles) do |obstacle|
  json.extract! obstacle, :id, :skill, :dc, :description, :chase_id
  json.url obstacle_url(obstacle, format: :json)
end
