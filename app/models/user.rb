class User < ApplicationRecord
  has_one :user_session
  validates :password, confirmation: true
  validates :terms_of_service, acceptance: true
  validates :email, :password, :password_confirmation, :terms_of_service, presence: true

  def self.authenticate(email, password)
    User.find_by(email: email, password: password)
  end

end
