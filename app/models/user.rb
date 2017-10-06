class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true

  validates :username, presence: true,
                    uniqueness: { case_sensitive: false }

  validates :email, presence: true,
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false}
  
  validates :password, length: { minimum: 10, allow_blank: true}

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

  def self.authenticate(email_or_username, password)
    user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
    user && user.authenticate(password)
  end

end
