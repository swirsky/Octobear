json.array!(@users) do |user|
  json.extract! user, :id, :firstname, :lastname, :email, :username, :password, :roles_mask
  json.url user_url(user, format: :json)
end
