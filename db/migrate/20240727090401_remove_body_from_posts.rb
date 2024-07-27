class RemoveBodyFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :body, :string
  end
end
