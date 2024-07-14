class Public::CommunitiesController < ApplicationController
  def index
    @community = Community.new
    @communities = Community.all
    #@community_topics = @topics.page(params[:page])
  end

  def show
    @community = Community.find(params[:id])
    @topics = @community.topics
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

  private

  def community_params
    params.require(:community).permit(:name, :introduction, :is_active, )
  end

  def ensure_correct_user
    @community = Community.find(params[:id])
    unless @community.owner_id == current_user.id
      redirect_to communities_path
    end
  end


end
