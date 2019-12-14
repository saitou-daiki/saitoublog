class Api::CommentsController < ApplicationController

  # def index
  #   @tweet = Tweet.find(params[:tweet_id])

  #   @comments = @tweet.comments.includes(:user).where('id > ?',params[:last_id])
    
  #   respond_to do |format|
  #     format.html
  #     format.json
  #   end
  #   # last_comment_id = params[:id].to_i

  #   # @comments = tweet.comments.includes(:user).where("id > #{last_tweet_id}")
  # end

  def index
    @tweet = Tweet.find(params[:tweet_id])

    @comments = @tweet.comments.includes(:user).where('id > ?',params[:last_id])

    respond_to do |format|
      format.html
      format.json
    end
  end
    # last_comment_id = params[:id].to_i
    # respond_to do |f|
    #   f.json { render json: {comments: @comments, tweet: @tweet }}
    # end

  def new
    @tweet = Tweet.find(params[:tweet_id])

    @comments = @tweet.comments.includes(:user).where('id > ?',params[:last_id])

    respond_to do |f|
      f.json { render json: {comments: @comments, tweet: @tweet }}
    end
    
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
    # last_comment_id = params[:id].to_i

    # @comments = tweet.comments.includes(:user).where("id > #{last_tweet_id}")
  end
end

