class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comments = Comment.includes(:community, :topic).order(created_at: :desc)
  end

  def destroy
    @community = Community.find(params[:community_id])
    @topic = @community.topics.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.destroy
    flash.now[:notice] = "コメントを削除しました。"
    redirect_to admin_community_topic_path(@community, @topic)
  end

end
