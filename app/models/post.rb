class Post < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, presence: { message: 'を入力してください' }, length: { maximum: 30, message: 'は30文字以内で入力してください' }
  validates :subtitle, presence: { message: 'を入力してください' }, length: { maximum: 100, message: 'は50文字以内で入力してください' }
  validates :body, presence: { message: 'を入力してください' }
  validates :image, presence: { message: 'を選択してください' }

  #scope :search, ->(query) { where('title LIKE ? OR body LIKE ?', "%#{query}%", "%#{query}%") }

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [300, 200])
  end

  # 特定のユーザーが「いいね」しているかを確認するメソッド
  def like_by?(user)
    likes.exists?(user_id: user.id)
  end

end
