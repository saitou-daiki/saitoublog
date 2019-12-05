class TweetsController < ApplicationController
  before_action :validates_tweet, only: :create

  def validates_tweet
    @tweet = Tweet.new(tag_ids: tweet_params[:tag_ids],title: tweet_params[:title],content: tweet_params[:content] ,image: tweet_params[:image])
    render '/tweets/new' unless @tweet.valid?
  end

  def index

    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order('id DESC')
  end

  def new
    redirect_to action: :index unless user_signed_in?
    @tweet = Tweet.new
  end

  def show
     @tweet = Tweet.find(params[:id])
     @comment = Comment.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to root_path
    else
      render 'tweets/edit'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    
      if @tweet.destroy
        redirect_to root_path
      else
        render 'tweets/show'
      end
       
  end

  def create
    # Tweet.create(name: params[:name], image: params[:image], text: params[:text]) #データを作成し保存する。
    if Tweet.create(tweet_params)
      redirect_to root_path
    else
      render 'tweets/new'
    end
    #カレントユーザーは括弧で囲む必要はない。注意。
  end

  def tweet_params
    params.require(:tweet).permit(:title, :image, :content, :tag_ids).merge(user_id: current_user.id)
    #includesメソッド、app.htmlを変えたことで、nameを減らした。アソシエーションで、nicknameがいらなくなり、無くした影響。
  end


end
