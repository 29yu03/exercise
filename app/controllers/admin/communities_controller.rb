class Admin::CommunitiesController < ApplicationController
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

  private

  def admin_community_params
    params.require(:community).permit(:name, :is_active, )
  end
end
