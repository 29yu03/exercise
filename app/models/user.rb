class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :introduction, length: { maximum: 500 }, allow_blank: true
  validates :last_name, :first_name, presence: true, length: { maximum: 50 }
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\u30fc]+\z/, message: "を入力してください" }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の数字で入力してください" }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true, :on => :create

  has_many :posts, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :permits, dependent: :destroy
  has_many :communities, through: :group_users
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :following

  # フォロワーとの関連付け
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "following_id",
                                   dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  # フォローするメソッド
  def follow(other_user)
    following << other_user
  end

  # フォローを解除するメソッド
  def unfollow(other_user)
    following.delete(other_user)
  end

  # すでにフォローしているか確認するメソッド
  def following?(other_user)
    following.include?(other_user)
  end

  has_one_attached :profile_image

  def get_profile_image(width, height)
    if profile_image.attached?

    profile_image
      .variant(
        resize_to_fill: [width, height],
        gravity: "center"
      ).processed
    else
      ActionController::Base.helpers.asset_path('no_image.jpg')
    end
  end

  #名前統合
  def full_name
    "#{last_name} #{first_name}"
  end

end
