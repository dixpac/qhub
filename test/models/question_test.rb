require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  setup do
    @best_footballer = questions(:best_footballer)
  end

  test "best_footbaler is a valid fixture" do
    assert @best_footballer.valid?
  end
end
