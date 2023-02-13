class Book < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_one_attached :image
end
