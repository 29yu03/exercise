class Public::CommunitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy, :permits, :member]

  def index
    @community = Community.new
    @communities = Community.page(params[:page]).per(16)
    #@community_topics = @topics.page(params[:page])
  end

  def show
    @community = Community.find(params[:id])
    @topics = @community.topics.page(params[:page]).per(15) if @community.present?
    @topic = Topic.new
    @communities = Community.page(params[:page]).per(10)
  end

  def edit
    unless @community.owner_id == current_user.id
      redirect_to community_path
    end
  end

  def create
    @community = Community.new(community_params)
    #@communities = Community.all
    @community.owner_id = current_user.id
    if @community.save
      redirect_to communities_path
    else
      @communities = Community.all
      render :index
    end
  end

  def update
    if @community.update(community_params)
      redirect_to communities_path
    else
      render :edit
    end
    unless @community.owner_id == current_user.id
      redirect_to community_path
    end
  end

  def permits
    @permits = @community.permits
    #@permits = @community.permits.page(params[:page])
  end

  def member
    #@permits = @community.permits.page(params[:page])
  end

  def destroy
    @community.destroy
    redirect_to communities_path(current_user), notice: '投稿が削除されました。'
  end

  private

  def community_params
    params.require(:community).permit(:name, :introduction, :is_active, )
  end

  def ensure_correct_user
    @community = Community.find(params[:id])

  end


end
