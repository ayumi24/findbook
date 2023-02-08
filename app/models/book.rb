class Book < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :tag
  has_one_attached :image
end
