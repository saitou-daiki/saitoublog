class CommentsController < ApplicationController
  before_action :set_group


  def index

    @comments =  @tweet.comments.includes(:user)
    
    @comment = Comment.new
  end

  def create
    
    @comment = Comment.create(comment_params)
  
    respond_to do |format|
      format.html { redirect_to tweet_comments_path(@tweet)}
      format.json
    end
 
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(tweet_id: params[:tweet_id],user_id: current_user.id)
  end
  def set_group
    @tweet = Tweet.find(params[:tweet_id])
  end
end


