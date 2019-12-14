json.id @comment.id
json.comment @comment.comment
json.user_name @comment.user.name
json.created_at @comment.created_at.to_S
json.tweet_id @comment.tweet_id

json.id  @tweet.id