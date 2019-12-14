json.id       @comment.id
json.user_id  @comment.user.id
json.tweet_id  @comment.tweet_id

json.user_name @comment.user.name
json.comment  @comment.comment

json.created_at @comment.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.id @comment.id
