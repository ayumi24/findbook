class Post < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :tag, optional: true
  has_many :post_comments, dependent: :destroy
end
