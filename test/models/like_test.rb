require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  setup do
    @like = likes(:jerry_likes_first_question)
  end

  test "like is valid model" do
    assert @like.valid?
  end

  test "#liking?, returns true if liker likes likeable" do
    assert Like.liking?(liker: @like.liker,likeable: @like.likeable)
  end

  test "#liking?, returns false if liker don't like likeable" do
    refute Like.liking?(liker: users(:elaine), likeable: @like.likeable)
  end

  test "#like, creates new row for liker and likeable" do
    assert_difference "Like.count" do
      Like.like liker: users(:jerry), likeable: answers(:best_footballer_third_answer)
    end
  end

  test "#like, doesn't insert duplicate rows" do
    assert_no_difference "Like.count" do
      Like.like liker: @like.liker, likeable: @like.likeable
    end
  end

  test "#unlike, removed liker for likeable" do
    Like.unlike(liker: @like.liker,likeable: @like.likeable)
    refute Like.liking?(liker: @like.liker,likeable: @like.likeable)
  end
end
