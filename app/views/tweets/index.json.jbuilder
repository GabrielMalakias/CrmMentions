json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :retweets, :favorited, :content, :post_date
  json.url tweet_url(tweet, format: :json)
end
