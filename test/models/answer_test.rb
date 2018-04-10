require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  setup do
    @best_footballer_first_answer = answers(:best_footballer_first_answer)
  end

  test "best_footbaler_first_answer is a valid fixture" do
    assert @best_footballer_first_answer.valid?
  end
end
