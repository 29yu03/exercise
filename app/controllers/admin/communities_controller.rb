class Admin::CommunitiesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @community = Community.new
    @communities = Community.all
  end

  def create
    @community = Community.new(admin_community_params)
    @communities = Community.all
    if @community.save
      redirect_to admin_communities_path
    else
      render :index
    end
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

  def update
    @community = Community.find(params[:id])
    if @community.update(admin_community_params)
      redirect_to admin_communities_path
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

  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    redirect_to admin_communities_path
  end

  private

  def admin_community_params
    params.require(:community).permit(:name, :is_active, )
  end
end
