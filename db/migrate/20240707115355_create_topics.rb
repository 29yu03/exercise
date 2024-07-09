class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.integer :community_id
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
