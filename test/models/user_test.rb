require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @jerry = users(:jerry)
  end

  test "jerry is a valid fixture" do
    assert @jerry.valid?
  end
end
