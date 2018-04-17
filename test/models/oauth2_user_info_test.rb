require 'test_helper'

class Oauth2UserInfoTest < ActiveSupport::TestCase
  setup do
    @jerry_google = oauth2_user_infos(:jerry_google)
  end

  test "jerry_google fixture is valid" do
    assert @jerry_google.valid?
  end
end
