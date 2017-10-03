class Post < ApplicationRecord

	has_many :comments, dependent: :destroy

	validates :title, :author, :category, :published_on, presence: true
	validates :body, length: { minimum: 25 }
	validates :image_file_name, allow_blank: true, format: {
  with:    /\w+\.(gif|jpg|png)\z/i,
  message: "must reference a GIF, JPG, or PNG image"
	}

	CATEGORIES = [ 
    'General',
    'Ruby on Rails',
    'Javascript',
  ]

end
