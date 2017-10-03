class Comment < ApplicationRecord
  belongs_to :post

  validates :name, :email, :comment, presence: true
end
