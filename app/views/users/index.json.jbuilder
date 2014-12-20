json.array!(@users) do |user|
  json.extract! user, :id, :screen_name, :number_followers
  json.url user_url(user, format: :json)
end
