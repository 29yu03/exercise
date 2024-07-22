class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :introduction, length: { maximum: 500 }, allow_blank: true
  validates :last_name, :first_name, presence: true, length: { maximum: 50 }
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\u30fc]+\z/, message: "はカタカナで入力してください" }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の数字で入力してください" }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true, if: :password_required?

  has_many :posts, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :permits, dependent: :destroy
  has_many :ommunities, through: :group_users
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy


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
