class ApplicationController < ActionController::Base
  include ApplicationHelper

  def redirect_user
    user = authenticated?
    redirect_to after_login_path(user.user_session), notice: 'You are logged in ..' and return  if user
  end

  def after_login_path(session)
    user_session_path(session)
  end

  alias_method :authenticated_path, :after_login_path
end
