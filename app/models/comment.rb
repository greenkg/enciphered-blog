class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :comment, length: { minimum: 4}
end
