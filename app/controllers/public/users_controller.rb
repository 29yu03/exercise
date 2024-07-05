class Public::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :configure_password_length, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
    @posts = @user.posts

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User was successfully updated."
    else
      render :edit
    end
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
