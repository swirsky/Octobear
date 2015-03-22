json.array!(@attacks) do |attack|
  json.extract! attack, :id, :name, :type, :damage, :effect, :critchance, :tohit
  json.url attack_url(attack, format: :json)
end
