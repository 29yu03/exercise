class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 1_200 }
end
