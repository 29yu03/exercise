class Public::TopicsController < ApplicationController
  def index
    @topic = Topic.new
    @topics = Topic.order(created_at: :desc)
    @communities = Community.all
    puts @topics.inspect
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.community_id = 1 #仮でいれたやつ
    if @topic.save
      flash[:notice] = "投稿が作成されました。"
      redirect_to topics_path
    else
      flash[:error] = topic.errors.full_messages.join(", ")
      redirect_to topics_path
    end

  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body)
  end

end
