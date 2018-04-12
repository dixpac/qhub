require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  setup do
    @best_footballer = questions(:best_footballer)
  end

  test "best_footbaler is a valid fixture" do
    assert @best_footballer.valid?
  end

  test ".search, performs full-text search on title" do
    Question.reindex
    results = Question.search("best").results

    assert_equal 2, results.size
    assert_equal questions(:best_footballer), results.first
    assert_equal questions(:favourite_sitcom), results.second
  end

  test ".search, returns empty arras in no matches" do
    Question.reindex
    results = Question.search("").results

    assert_empty results
    assert_kind_of Array, results
  end
end
