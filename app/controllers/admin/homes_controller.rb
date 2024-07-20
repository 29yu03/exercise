class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @users = User.order(created_at: :desc).limit(5)
    @posts = Post.order(created_at: :desc).limit(3)
    @communities = Community.order(created_at: :desc).limit(5)
    @topics = Topic.order(created_at: :desc).limit(5)
    @comments = Comment.order(created_at: :desc).limit(5)
  end
end
