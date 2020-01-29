class SignInController < ApplicationController
   before_action :redirect_user, only: [:new]

  def new
    @user_session = UserSession.new
  end


  def create
    @user_session = UserSession.new(sign_in_params)
      if @user_session.save
        remember(@user_session)
        redirect_to @user_session, notice: 'Login Successful.'
      else
        redirect_to root_path, notice: 'Username/Password Mismatch'
    end
  end

  def destroy
    @user_session.destroy
  end

  private

  def sign_in_params
    params.require(:user_session).permit(:password, :email, :remember_me)
  end

  def remember(user_session)
    cookies.permanent.signed[:user_id] = user_session.user_id
    cookies.permanent[:remember_digest] = user_session.remember_digest
  end
end
