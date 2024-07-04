class Public::PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    post = Post.new(post_params)
    post.save
    redirect_to '/posts'
  end

  def show
    @post = Post.find(params[:id])

  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:title, :subtitle, :body, :image)
  end

end
