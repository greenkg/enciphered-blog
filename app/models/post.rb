class Post < ApplicationRecord

  has_one :project

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  has_many :topicalizations, dependent: :destroy
  has_many :topics, through: :topicalizations

	validates :title, :author, :published_on, presence: true
	validates :body, length: { minimum: 25 }
	validates :image_file_name, allow_blank: true, format: {
  with:    /\w+\.(gif|jpg|png)\z/i,
  message: "must reference a GIF, JPG, or PNG image"
	}

end
