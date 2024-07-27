class Public::CommentsController < ApplicationController

  def create
    @community = Community.find(params[:community_id])
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.new(comment_params)
    @comment.topic_id = @topic.id
    if @comment.save
      @new_comment = Comment.new
      @comments = @topic.comments.includes(:user).order(created_at: :desc) # コメントリストを初期化
    else
      render 'topics/show'
    end
  end

  def destroy
    @community = Community.find(params[:community_id])
    @topic = @community.topics.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.destroy
    flash.now[:notice] = "コメントを削除しました。"
    redirect_to community_topic_path(@community, @topic)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(topic_id: params[:topic_id])
  end
end
