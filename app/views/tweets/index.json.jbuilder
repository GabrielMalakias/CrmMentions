json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :retweet_count, :favorite_count, :text, :created_at
  json.url tweet_url(tweet, format: :json)
end
