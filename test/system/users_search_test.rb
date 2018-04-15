require "application_system_test_case"

class UserSearchTest < ApplicationSystemTestCase
  setup do
    sign_in users(:jerry)
    visit root_url
  end

  test "User can find questions using full-text search" do
    question = questions(:best_footballer)
    search_term = question.title[0...5]

    perform_search_for search_term: search_term

    assert_text "Searching for #{search_term}"

    click_link question.title

    assert_text question.title
    assert_text question.creator.name
    assert_equal page.current_path, question_path(question)
  end

  test "User can find answer using full-text search" do
    answer = answers(:best_footballer_third_answer)
    search_term = answer.content
    perform_search_for search_term: search_term

    assert_text "Searching for #{search_term}"

    click_link answer.question.title

    assert_text answer.question.title
    assert_text answer.question.creator.name
    assert_equal page.current_path, question_path(answer.question)
    assert page.current_url.match /#answer_#{answer.id}/
  end

  def perform_search_for(search_term:)
    fill_in "q", with: search_term
    click_button "search"
  end
end
