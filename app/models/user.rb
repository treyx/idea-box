class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :email_address, presence: true, uniqueness: true
  has_secure_password
  enum role: %w(user admin)
end