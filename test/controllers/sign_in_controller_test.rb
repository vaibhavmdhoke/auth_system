require 'test_helper'

class SignInControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should be able to login with valid password" do
    post sign_in_url(@user_session), params: { user_session: { email: @user.email, password: '1234567890' } }
    assert_redirected_to user_session_url(@user.user_session)
  end

  test "should be able to login with valid password and session to be for 14 days" do
    post sign_in_url(@user_session), params: { user_session: { email: @user.email, password: '1234567890', remember_me: '1' } }
    assert_redirected_to user_session_url(@user.user_session)
    assert_equal(@user.user_session.expires_at.strftime('%c'), (Time.now + 14.days).utc.strftime('%c') )
  end

  test "should not be able to login with invalid password" do
    post sign_in_url(@user_session), params: { user_session: { email: @user.email, password: 'invalid' } }
    assert_redirected_to root_path
  end

end
