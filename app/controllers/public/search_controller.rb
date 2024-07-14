class Public::SearchController < ApplicationController
  def index
    @query = params[:query]
    @posts = Post.where('name LIKE ?', "%#{@query}%")
    @genres_all = Genre.all
  end
end
