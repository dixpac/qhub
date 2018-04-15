require "test_helper"

class Users::OmniauthCallbacksControllerTest < ActionDispatch::IntegrationTest
  test "can sign up using a Google account" do
    stub_omniauth provider: :google_oauth2

    assert_difference ["User.count", "Oauth2UserInfo.count"] do
      get user_google_oauth2_omniauth_callback_url
    end
    assert_redirected_to root_url
  end

  test "can login with connected Google account" do
    stub_omniauth_for user: users(:jerry)

    assert_no_difference ["User.count", "Oauth2UserInfo.count"] do
      get user_google_oauth2_omniauth_callback_url
    end
    assert_redirected_to root_url
  end
end
