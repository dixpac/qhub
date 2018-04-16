require 'test_helper'

class GuardianTest < ActiveSupport::TestCase
  setup do
    @jerry = users(:jerry)
    @jerrys_question = questions(:best_footballer)
  end

  test ".can_manage? returns true if user is creator of record" do
    assert Guardian.new(@jerry, @jerrys_question).can_manage?
  end

  test ".can_manage? returns false if user is not creator of record" do
    george = users(:george)
    refute Guardian.new(george, @jerrys_question).can_manage?
  end
end
