class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @relationship = current_user.active_relationships.create(following_id: params[:following_id])
    redirect_to request.referer
  end

  def destroy
    @relationship = current_user.active_relationships.find(params[:id])
    @relationship.destroy
    redirect_to request.referer
  end
end