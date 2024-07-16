class Public::TopicsController < ApplicationController
  before_action :find_community, only: [:create]

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.community_id = @community.id
    if @topic.save
      flash[:notice] = "投稿が作成されました。"
      @community = Community.find(params[:community_id])
      @topics = @community.topics
      redirect_to community_path(@community)
    else
      flash[:error] = @topic.errors.full_messages.join(", ")
      redirect_to community_path(@community)
    end

  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      flash[:notice] = "投稿が更新されました。"
      redirect_to community_topic_path(@topic.community, @topic)
    else
      flash[:error] = @topic.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def find_community
    @community = Community.find(params[:community_id])
  end

  def topic_params
    params.require(:topic).permit(:title, :body)
  end

end
