class User < ApplicationRecord
  has_secure_password(validations: false)

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  validates :name, :password_digest, presence: true

  validates :email, presence: true,
                    format: /\A\S+@\S+\z/,
                    unless: :guest?
                    
  validates :email, uniqueness: { case_sensitive: false}, unless: :guest?
  
  validates :password, length: { minimum: 10, allow_blank: true}

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase) if self.email
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

  def self.new_guest(name, email)
    new do |u|
      u.guest = true
      u.name = name
      u.email = email
      random_password = SecureRandom.base58
      u.password = random_password
      u.password_confirmation = random_password
      random_password = nil
    end
  end

end
