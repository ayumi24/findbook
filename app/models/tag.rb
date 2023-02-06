class Tag < ApplicationRecord
  has_many :books, dependent: :destroy
end
