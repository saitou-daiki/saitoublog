# json.ids @tweets.length
# json.keyword params[:keyword]


json.array! @tweets do |tweet|


  json.title tweet.title
  json.created_at tweet.created_at.to_s
  json.tags_first_name tweet.tags.first.name
  json.tweet_id tweet.id
  json.content tweet.content
  json.image tweet.image.url
  json.user_id tweet.user_id
  json.name tweet.user.name
  json.user_sign_in current_user

  json.ids @tweets.length
  json.keyword params[:keyword]

end
