require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jerry = users(:jerry)
  end

	test "User logs in sucessfully with valid credentials" do
    get new_user_session_url
    assert_response :success

		options = { email: @jerry.email, password: default_password }
		post user_session_url, params: { user: options }

    assert_response :redirect
    follow_redirect!
		assert_response :success
	end

	test "User can't login with invalid credentials" do
		options = { email: @jerry.email, password: "invalid" }
    assert_no_difference "User.count" do
		  post user_session_url, params: { user: options }
    end
	end
end
