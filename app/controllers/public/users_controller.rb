class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  before_action :configure_password_length, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(8)
    @topics = @user.topics.page(params[:page]).per(20) if @user.present?
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to root_path
    end
      @posts = @user.posts
  end

  def update
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to root_path
    end
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def deactivate
    @user = User.find_by(id: params[:id])
    if @user.update(is_active: false)
      reset_session
      redirect_to new_user_registration_path, notice: "退会が完了しました。"
    else
      redirect_to user_path(@user), alert: "退会に失敗しました。"
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:introduction, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :telephone_number, :is_active, :profile_image, :password, :password_confirmation)
  end

  def configure_password_length
    @minimum_password_length = Devise.password_length.min
  end

end


