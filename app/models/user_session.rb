class UserSession < ApplicationRecord
  belongs_to :user
  before_validation :authenticate_user
  attr_accessor :email, :password, :remember_me
  before_save :compute_session_expiry

  private

  def authenticate_user
    @user = User.authenticate(email, password)
    return false if @user.nil?

    destroy_session if @user.user_session.present?

    set_user_id
  end

  def compute_session_expiry
    expiry_time = if self.remember_me == '1'
      14.days
    else
       8.hours
    end
    self.expires_at = Time.now + expiry_time
  end

  def set_user_id
    self.user_id = @user.id
  end

  # Destroys previous session
  def destroy_session
    @user.user_session.destroy
  end

end
