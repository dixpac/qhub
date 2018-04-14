require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @jerry = users(:jerry)
  end

  test "jerry is a valid fixture" do
    assert @jerry.valid?
  end

  test ".likes?, returns true if user liked the answer" do
    assert @jerry.likes?(answers(:best_footballer_second_answer))
  end

  test ".likes?, returns false if user didn't liked the answer" do
    refute @jerry.likes?(answers(:best_footballer_third_answer))
  end
end
