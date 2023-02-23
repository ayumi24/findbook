class Tag < ApplicationRecord
  has_many :posts, dependent: :destroy
end
