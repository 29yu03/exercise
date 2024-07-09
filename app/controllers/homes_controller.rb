class HomesController < ApplicationController

  def top
    @posts = Post.includes(:user).limit(10)
  end

  def about
  end
end
