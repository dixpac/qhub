require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:jerry)
  end

  test "User can ask new question" do
    get new_question_url
    assert_response :success

    options = { title: "New question", content: "Question content" }

    assert_difference "Question.count" do
      post questions_url, params: { question: options }
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "User ask question without title and content" do
    post questions_url, params: { question: { title: "", content: "" } }

    assert_select "li", "Title can't be blank"
    assert_select "li", "Content can't be blank"
  end
end
