class CommentsController < ApplicationController

  def index
    @tweet = Tweet.find(params[:tweet_id])

    @comments =  @tweet.comments.includes(:user)
    
    @comment = Comment.new
  end

  def new
    @tweet = Tweet.find(params[:tweet_id])

    @comments =  @tweet.comments.includes(:user)
    
    @comment = Comment.new
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    
    @comment = Comment.create(comment_params)
  
    respond_to do |format|
      format.html
      format.json
    end
    # redirect_to new_tweet_comment_path(@tweet)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(tweet_id: params[:tweet_id],user_id: current_user.id)
  end
end
