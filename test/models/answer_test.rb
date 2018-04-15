require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  setup do
    @best_footballer_first_answer = answers(:best_footballer_first_answer)
  end

  test "best_footbaler_first_answer is a valid fixture" do
    assert @best_footballer_first_answer.valid?
  end

  test ".search, performs full-text search on content" do
    Answer.reindex
    results = Answer.search("messi").results

    assert_equal 2, results.size
    assert_equal answers(:best_footballer_first_answer), results.first
    assert_equal answers(:best_footballer_second_answer), results.second
  end

  test ".search, returns empty arras in no matches" do
    Answer.reindex
    results = Answer.search("").results

    assert_empty results
    assert_kind_of Array, results
  end
end
