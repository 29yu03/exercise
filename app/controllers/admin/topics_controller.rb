class Admin::TopicsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @topics = Topic.all
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
  end

  def update
    @community = Community.find(params[:community_id])
    @topic = @community.topics.find(params[:id])
    if @topic.update(topic_params)
      redirect_to admin_community_topic_path(@community, @topic), notice: 'トピックが更新されました。'
    else
      flash[:error] = @topic.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body)
  end


end
