class Api::CommentsController < ApplicationController

  def index
    @tweet = Tweet.find(params[:tweet_id])

    @comments = @tweet.comments.includes(:user).where('id > ?',params[:last_id])

    respond_to do |format|
      format.html
      format.json
    end
  
  end
end

