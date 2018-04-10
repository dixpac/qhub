require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @best_footballer = questions(:best_footballer)
    sign_in users(:jerry)
  end

  test "User can post answer to question sucessfully" do
    assert_difference "Answer.count" do
      post question_answers_url(@best_footballer), params: { answer: { content: "New answer"} }, xhr: true
    end
    assert_response :success
  end

  test "User can't post empty answer" do
    assert_no_difference "Answer.count" do
      post question_answers_url(@best_footballer), params: { answer: { content: ""} }, xhr: true
      assert_response :error
    end
  end
end
