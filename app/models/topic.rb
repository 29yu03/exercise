class Topic < ApplicationRecord
  belongs_to :user
  has_many :community

  validates :title, presence: true
  validates :body, presence: true
end
