class HomesController < ApplicationController

  def top
    @posts = Post.limit(10)
  end

  def about
  end
end
