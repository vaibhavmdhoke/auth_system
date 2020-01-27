class UserSession < ApplicationRecord
  belongs_to :user
  before_validation :authenticate_user
  before_save :set_session_expiry
  attr_accessor :email, :password

  private

  def authenticate_user
    user = User.authenticate(email, password)
    return false if user.nil?

    destroy_session(user) if user.user_session.present?
    self.user_id = user.id
  end

  def set_session_expiry
    self.expires_at = Time.now + 14.days
  end

  def destroy_session(user)
    user.user_session.destroy
  end

end
