class Admin::GroupUsersController < ApplicationController
  before_action :authenticate_admin!

  def create
    @community = Community.find(params[:community_id])
    @permit = Permit.find(params[:permit_id])
    @group_user = GroupUser.create(user_id: @permit.user_id, community_id: params[:community_id])
    @permit.destroy #参加希望者リストから削除する
    redirect_to request.referer
  end

  def destroy
    # group_userの中からさらに、group_idカラムのデータがグループ詳細ページと一緒のデータを探す。
    group_user = group_users.find_by(community_id: params[:community_id])
    group_user.destroy
    redirect_to request.referer
  end

end
