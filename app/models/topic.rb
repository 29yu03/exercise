class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :community

  validates :title, presence: true
  validates :body, presence: true
end
