class Book < ApplicationRecord
  has_many :posts, dependent: :destroy
end
