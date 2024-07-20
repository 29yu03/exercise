class Admin::TopicsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @topics = Topic.all
  end

  def edit
  end
end
