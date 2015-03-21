json.array!(@chases) do |chase|
  json.extract! chase, :id, :name, :cr, :user_id, :description
  json.url chase_url(chase, format: :json)
end
