class Public::CommunitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy, :permits]

  def index
    @community = Community.new
    @communities = Community.all
    #@community_topics = @topics.page(params[:page])
  end

  def show
    @community = Community.find(params[:id])
    @topics = @community.topics if @community.present?
    @topic = Topic.new
    @communities = Community.all
  end

  def edit
    @community = Community.find(params[:id])
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
    @community = Community.find(params[:id])
    if @community.update(community_params)
      redirect_to communities_path
    else
      render :edit
    end
  end

  def permits
    @community = Community.find(params[:id])
    @permits = @community.permits
    #@permits = @community.permits.page(params[:page])
  end

  def member
    @community = Community.find(params[:id])
    #@permits = @community.permits.page(params[:page])
  end

  private

  def community_params
    params.require(:community).permit(:name, :introduction, :is_active, )
  end

  def ensure_correct_user
    @community = Community.find(params[:id])
    unless @community.owner_id == current_user.id
      redirect_to communities_path(@community), alert: "グループオーナーのみ編集が可能です"
    end
  end


end
