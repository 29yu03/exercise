class Public::TopicsController < ApplicationController
  before_action :find_community, only: [:create, :destroy]

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
    @comment = Comment.new #コメントの新規作成
    @comments = @topic.comments.includes(:user).order(created_at: :desc)
    @community = @topic.community
  end

  def edit
    @community = Community.find(params[:community_id])
    @topic = @community.topics.find(params[:id])
    unless @topic.user.id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @community = Community.find(params[:community_id])
    @topic = @community.topics.find(params[:id])
    if @topic.update(topic_params)
      redirect_to community_topic_path(@community, @topic), notice: 'トピックが更新されました。'
    else
      flash[:error] = @topic.errors.full_messages.join(", ")
      render :edit
    end
    unless @topic.user.id == current_user.id
      redirect_to root_path
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to community_path(@community), notice: '投稿が削除されました。'
  end

  private

  def find_community
    @community = Community.find(params[:community_id])
  end

  def topic_params
    params.require(:topic).permit(:title, :body)
  end

end
