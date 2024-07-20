class HomesController < ApplicationController

  def top
    @posts = Post.includes(:user).limit(8)
  end

  def about
  end
end
