class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users


  has_one_attached :profile_image

  def get_profile_image(width, height)
    if profile_image.attached?
      #profile_image
      profile_image.variant(resize_to_limit: [width, height]).processed
    else
      ActionController::Base.helpers.asset_path('no_image.jpg')
    end
  end


end
