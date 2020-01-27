class User < ApplicationRecord
  has_one :user_session
  validates :password, confirmation: true
  validates :terms_of_service, acceptance: true
  validates :email, :terms_of_service, presence: true
  validates :email, uniqueness: true

  before_validation :set_password_digest

  attr_accessor :password_confirmation, :password


  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return false if user.nil?

    user.password = password
    user.authenticate
  end


  def set_password_digest
    password = Digest::SHA2.hexdigest(self.password)
    self.password_digest = password
  end


  def authenticate
    return self if Digest::SHA2.hexdigest(self.password) == self.password_digest

    false
  end


end
