class TweetsController < ApplicationController
  before_action :validates_tweet, only: :create
  before_action :set_tweet, only: [:show,:edit, :update,:destroy]
  # before_action :set_search, only: [:index, :show, :search]

    # def set_search
    #   @search = Tweet.ransack(params[:q])
    # end

  def validates_tweet
    @tweet = Tweet.new(tag_ids: tweet_params[:tag_ids],title: tweet_params[:title],content: tweet_params[:content] ,image: tweet_params[:image])
    render '/tweets/new' unless @tweet.valid?
  end

  def index
    @tweets = Tweet.order('id DESC').page(params[:page]).per(5)
    # @tweets = @search.result.order('id DESC').page(params[:page]).per(5) 
    # @result = @search.result
    # @tweets = Tweet.includes(:user).page(params[:page]).per(5).order('id DESC')
  end

  def new
    redirect_to action: :index unless user_signed_in?
    @tweet = Tweet.new
  end

  def update

    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render 'tweets/edit'
    end
  end

  def destroy
      if @tweet.destroy
        redirect_to root_path
      else
        render 'tweets/show'
      end
  end

  def create
    # Tweet.create(name: params[:name], image: params[:image], text: params[:text]) #データを作成し保存する。
    if Tweet.create(tweet_params)
      redirect_to controller: :tweets, action: :index
    else
      render 'tweets/new'
    end
    #カレントユーザーは括弧で囲む必要はない。注意。
  end

  def tweet_params
    params.require(:tweet).permit(:title, :image, :content, :tag_ids).merge(user_id: current_user.id)
    #includesメソッド、app.htmlを変えたことで、nameを減らした。アソシエーションで、nicknameがいらなくなり、無くした影響。
  end

  # def search
  
  #   # @kyewords = params[:keyword]
  
  #   @keyword = "%#{params[:keyword]}"
  #   # @tweets = Tweet.find_by_sql(["select * from tweets where content like ? LIMIT 10", @keyword])
  #   @tweets = Tweet.where('title LIKE(?) OR content LIKE(?)', "%#{params[:keyword]}%", "%#{params[:keyword]}%").limit(5)

  #   if params[:keyword] != nil
  #     params[:keyword]['title_cont_any'] = params[:q]['title_cont_any'].split(/[\p{blank}\s]+/)
  #     @keyword = Blog.ransack(params[:q])
  #     @blogs = @keyword.result
  #   else
  #     @keyword = Blog.ransack(params[:q])
  #     @blogs = @keyword.result #検索の結果を受け取る。
  #   end
  # end

  def search
    @keyword = "#{params[:keyword]}"
    @tweets = Tweet.where('title LIKE(?) OR content LIKE(?)', "%#{params[:keyword]}%", "%#{params[:keyword]}%").limit(5)
    # @search = Tweet.search(search_params)
    # @tweets = @search.result(distinct: true).order(created_at: 'DESC')
    # binding.pry
    respond_to do |format|
      format.html
      format.json
    end

  end
  
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
  # def search_params
  #   params.require(:q).permit(:title_or_content_cont)
  # end


  


end

 
