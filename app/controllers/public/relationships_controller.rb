class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @relationship = current_user.active_relationships.create(following_id: params[:following_id])
    redirect_to user_path(params[:following_id])
  end

  def destroy
    @relationship = current_user.active_relationships.find(params[:id])
    @relationship.destroy
    redirect_to user_path(params[:user_id])
  end
end