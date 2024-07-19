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
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def like
    @post = Post.find(params[:id])
    @like = @post.likes.build(user_id: current_user.id)

    respond_to do |format|
      if @like.save
        format.js
      else
        format.js { render js: 'alert("Error liking post");' }
      end
    end
  end

  def unlike
    @post = Post.find(params[:id])
    @like = @post.likes.find_by(user_id: current_user.id)

    respond_to do |format|
      if @like.destroy
        format.js
      else
        format.js { render js: 'alert("Error unliking post");' }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to  user_path
  end



  private
  def post_params
    params.require(:post).permit(:title, :subtitle, :body, :image)
  end

end
