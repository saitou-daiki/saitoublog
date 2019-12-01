class TweetsController < ApplicationController
  def index

    @tweets = Tweet.order('id DESC').limit(20)
  end

  def new
    redirect_to action: :index unless user_signed_in?
    @tweet = Tweet.new
  end
  def show
     @tweet = Tweet.find(params[:tweet_id])
  

  end

  def create
    # binding.pry
    # Tweet.create(name: params[:name], image: params[:image], text: params[:text]) #データを作成し保存する。
    if Tweet.create(tweet_params)
      redirect_to root_path
    else
      render 'tweets/new'
    end
    #カレントユーザーは括弧で囲む必要はない。注意。
  end

  def tweet_params
    params.require(:tweet).permit(:image, :content).merge(user_id: current_user.id)
    #includesメソッド、app.htmlを変えたことで、nameを減らした。アソシエーションで、nicknameがいらなくなり、無くした影響。
  end


end
