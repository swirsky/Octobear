json.array!(@users) do |user|
  json.extract! user, :id, :firstname, :lastname, :email, :username, :password, :access_role
  json.url user_url(user, format: :json)
end
