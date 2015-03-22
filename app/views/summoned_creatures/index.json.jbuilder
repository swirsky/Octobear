json.array!(@summoned_creatures) do |summoned_creature|
  json.extract! summoned_creature, :id, :name, :caster_id, :type, :hp, :str, :dex, :con, :intel, :wis, :cha, :weak_against, :resistant_against
  json.url summoned_creature_url(summoned_creature, format: :json)
end
