class Topic < ApplicationRecord

  has_many :topicalizations, dependent: :destroy
  has_many :posts, through: :topicalizations

  validates :name, presence: true, uniqueness: true
end
