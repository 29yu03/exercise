class Public::PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
    @user = current_user
  end

   def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:notice] = "投稿が作成されました。"
      redirect_to posts_path
    else
      @posts = Post.all
      @user = current_user
      render :index
    end
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
