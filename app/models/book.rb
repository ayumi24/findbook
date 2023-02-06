class Book < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :tag
end
