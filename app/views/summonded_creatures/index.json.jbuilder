json.array!(@summonded_creatures) do |summonded_creature|
  json.extract! summonded_creature, :id, :name, :caster_id, :type, :hp, :str, :dex, :con, :intel, :wis, :cha, :weak_against, :resistant_against
  json.url summonded_creature_url(summonded_creature, format: :json)
end
