require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  setup do
    sign_in users(:jerry)
    visit questions_url
  end

  test "User can see list of questions" do
    Question.all.each do |question|
      assert_text question.title
    end
  end

  test "User can see who liked the question" do
    question = questions(:best_footballer)
    likes = question.likes
    visit questions_url

    click_link question.title

    within "#likes_question_#{question.id}" do
      likes.each do |like|
        assert_selector "#like_#{like.id}"
      end
    end
  end

  test "User like or unlike question" do
    question = questions(:best_footballer)
    likes = question.likes
    visit questions_url

    click_link question.title


    within "#likes_question_#{question.id}" do
      find('a[data-behaviour="toggle_like"]').click

      likes.each do |like|
        refute_selector "#like_#{like.id}"
      end
    end

    within "#likes_question_#{question.id}" do
      find('a[data-behaviour="toggle_like"]').click

      likes.each do |like|
        assert_selector "#like_#{like.id}"
      end
    end
  end
end
