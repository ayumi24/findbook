class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name] #ユーザーログインでnameカラムを許可する
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

  has_one_attached :image
  has_one_attached :book_image_url
  has_one_attached :profile_image

  def self.guest
    find_or_create_by!(email: 'guest@test.com') do |user|
      user.password = SecureRandom.urlsafe_base64 #ランダムなパスワードを作成
      user.password_confirmation = user.password
      user.name = "ゲストユーザー" #ゲストログインした場合のニックネーム
    end
  end

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
