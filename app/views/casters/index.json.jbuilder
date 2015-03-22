json.array!(@casters) do |caster|
  json.extract! caster, :id, :name, :user_id, :wins, :losses, :ties
  json.url caster_url(caster, format: :json)
end
