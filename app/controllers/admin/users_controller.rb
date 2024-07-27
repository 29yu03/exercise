class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @topics = @user.topics if @user.present?

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      redirect_to admin_user_path(@user), notice: '会員情報を更新しました。'
    else
      render :edit
    end
  end

  def deactivate
    @user = User.find(params[:id])
    @user.update(is_active: false)
    redirect_to admin_users_path, notice: 'ユーザーを退会させました。'
  end

  def activate
    @user = User.find(params[:id])
    @user.update(is_active: true)
    redirect_to admin_users_path, notice: 'ユーザーのアカウントを有効にしました。'
  end

  private

  def user_params
    params.require(:user).permit(:introduction, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :telephone_number, :is_active, :profile_image, :password, :password_confirmation)
  end

  def authenticate_admin!
    redirect_to new_admin_session_path unless admin_signed_in?
  end

end
