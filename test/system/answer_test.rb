require "application_system_test_case"

class AnswerTest < ApplicationSystemTestCase
  setup do
    sign_in users(:jerry)
    visit questions_url
  end

  test "User can see who liked the question" do
    answer = answers(:best_footballer_second_answer)

    visit embeded_answer_path(answer )

    within "#likes_answer_#{answer.id}" do
      answer.likes.each do |like|
        assert_selector "#like_#{like.id}"
      end
    end
  end

  test "User like or unlike question" do
    answer = answers(:best_footballer_second_answer)

    visit embeded_answer_path(answer )

    within "#likes_answer_#{answer.id}" do
      find('a[data-behaviour="toggle_like"]').click

      answer.likes.each do |like|
        refute_selector "#like_#{like.id}"
      end
    end

    within "#likes_answer_#{answer.id}" do
      find('a[data-behaviour="toggle_like"]').click

      answer.likes.each do |like|
        refute_selector "#like_#{like.id}"
      end
    end
  end
end
