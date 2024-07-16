class Community < ApplicationRecord
  has_many :topics
  has_many :group_users, dependent: :destroy
  has_many :permits, dependent: :destroy
  has_many :users, through: :group_users

  validates :name, presence: true
  validates :introduction, presence: true

  validates :name, presence: true
end
