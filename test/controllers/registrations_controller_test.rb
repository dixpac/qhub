require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "Visitor can registers sucessfully when all data is provided" do
    get new_user_registration_url
    assert_response :success

    options = { email: "gregory@example.org", name: "Gregory House",
      password: default_password, password_confirmation: default_password }

    assert_difference "User.count" do
      post user_registration_url, params: { user: options }
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success
	end

	test "Visitor can't register without all data provided" do
    post user_registration_url, params: { user: {} }

    assert_select "li", "Email can't be blank"
    assert_select "li", "Password can't be blank"
    assert_select "li", "Name can't be blank"
	end

	test "Visitor can't register with already existing email" do
    options = { email: users(:jerry).email, name: "Gregory House",
      password: default_password, password_confirmation: default_password }

    post user_registration_url, params: { user: options }

    assert_select "li", "Email has already been taken"
	end
end
