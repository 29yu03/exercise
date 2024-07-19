class Admin::HomesController < ApplicationController
  def top
    @users = User.order(created_at: :desc).limit(5)
    @posts = Post.order(created_at: :desc).limit(3)
    @communities = Community.order(created_at: :desc).limit(5)
    @topics = Topic.order(created_at: :desc).limit(5)
    #@comments = @topic.comments.includes(:user).order(created_at: :desc)
  end
end
