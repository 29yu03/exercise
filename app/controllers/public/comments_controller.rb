class Public::CommentsController < ApplicationController

  def create
    @community = Community.find(params[:community_id])
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.new(comment_params)
    @comment.topic_id = @topic.id
    if @comment.save
      @new_comment = Comment.new
    else
      render 'topics/show'
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(topic_id: params[:topic_id])
  end
end
