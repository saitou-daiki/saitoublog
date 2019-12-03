class CommentsController < ApplicationController

  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    Comment.create(comment_params)
    redirect_to new_tweet_comment_path(@tweet)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(tweet_id: params[:tweet_id],user_id: current_user.id)
  end
end
