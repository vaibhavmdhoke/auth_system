module ApplicationHelper
  def authenticated?
    verify_login_session
  end

  def verify_login_session
    user_id = cookies.permanent.signed[:user_id]
    if user_id
      user = User.find_by_id(user_id)
      user_session = user.user_session
      return false if invalid_session?(user_session)
    else
      return false
    end
    user
  end

  def invalid_session?(user_session)
    user_session&.remember_digest != cookies.permanent[:remember_digest] || user_session.expired?
  end
end
