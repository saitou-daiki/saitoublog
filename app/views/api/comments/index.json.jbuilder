json.array! @comments do |comment|

  json.comment comment.comment
  json.created_at comment.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.user_name comment.user.name
  json.id comment.id
  json.tweet_id comment.tweet_id
end

