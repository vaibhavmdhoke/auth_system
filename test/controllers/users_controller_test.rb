require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: 'aa@email.com', name: 'username', password: 'abcd', password_confirmation:'abcd', terms_of_service: '1'  } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should not create user without terms_of_service" do
    assert_same(User.count, 2) do
      post users_url, params: { user: { email: 'aa@email.com', name: 'username', password: 'abcd', password_confrmation:'abcd'  } }
    end
  end

  test "should not create user without password_confirmation" do
    assert_same(User.count, 2) do
      post users_url, params: { user: { email: 'aa@email.com', name: 'username', password: 'abcd', terms_of_service: '1'  } }
    end
  end

  test "should not create user without email" do
    assert_same(User.count, 2) do
      post users_url, params: { user: { name: 'username', password: 'abcd', password_confrmation:'abcd', terms_of_service: '1'  } }
    end
  end
end
