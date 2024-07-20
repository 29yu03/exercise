class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comments = Comment.includes(:community, :topic).order(created_at: :desc)
  end

end
