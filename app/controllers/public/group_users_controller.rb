class Public::GroupUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_community, only: [:create, :destroy]

  def create
    @permit = Permit.find(params[:permit_id])
    @group_user = GroupUser.create(user_id: @permit.user_id, community_id: params[:community_id])
    @permit.destroy #参加希望者リストから削除する
    redirect_to request.referer
  end

  def destroy
     # コミュニティオーナであれば、コミュニティオーナの確認を行い、対象ユーザーを見つけて削除
     if @community.owner_id == current_user.id
      # コミュニティオーナが自分以外のグループユーザーを退出させる場合
      group_user = GroupUser.find_by(community_id: @community.id, user_id: params[:user_id])
      group_user.destroy if group_user
    else
      # 自分のIDを持ったグループユーザーを見つけて削除
      group_user = current_user.group_users.find_by(community_id: @community.id)
      group_user.destroy if group_user
    end

    redirect_to request.referer
  end

  def set_community
    @community = Community.find(params[:community_id])
  end

end
