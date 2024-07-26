class Admin::SearchController < ApplicationController
  def index
    #検索キーワード取得
    @query = params[:q]
    #検索結果を格納するための空のハッシュ@resultsを初期化
    @results = {}

    #検索結果が存在すれば
    if @query.present?
      @results[:posts] = Post.where('title LIKE ? OR body LIKE ?', "%#{@query}%", "%#{@query}%")
      @results[:users] = User.where(
        'last_name LIKE ? OR first_name LIKE ? OR last_name_kana LIKE ? OR first_name_kana LIKE ? OR email LIKE ?',
        "%#{@query}%",
        "%#{@query}%",
        "%#{@query}%",
        "%#{@query}%",
        "%#{@query}%"
      )
      @results[:communities] = Community.where('name LIKE ? OR introduction LIKE ?', "%#{@query}%", "%#{@query}%")
    end
  end
end
