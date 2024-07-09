class Public::CommunitiesController < ApplicationController
  def index
    @communities = Community.all
    @community = Community.find(params[:id])
    @topics = @community.topics
    #@community_topics = @topics.page(params[:page])
  end

  def show
  end

  def edit
  end
end
