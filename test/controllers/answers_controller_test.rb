require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @best_footballer = questions(:best_footballer)
    @answer = answers(:best_footballer_third_answer)
  end

  test "User can post answer to question sucessfully" do
    sign_in users(:jerry)
    assert_difference "Answer.count" do
      post question_answers_url(@best_footballer), params: { answer: { content: "New answer"} }, xhr: true
    end
    assert_response :success
  end

  test "User can't post empty answer" do
    sign_in users(:jerry)
    assert_no_difference "Answer.count" do
      post question_answers_url(@best_footballer), params: { answer: { content: ""} }, xhr: true
      assert_response :error
    end
  end

  test "User can edit his answer" do
    sign_in users(:jerry)
    patch question_answer_url(@best_footballer, @answer), params: { answer: { content: "new content" } }, xhr: true
    assert_response :success
  end

  test "User can't edit other user answer" do
    sign_in users(:george)
    assert_raises Guardian::NotAuthorizedError do
      patch question_answer_url(@best_footballer, @answer), params: { answer: { content: "new content" } }, xhr: true
    end
  end

  test "User can delete his answer" do
    sign_in users(:jerry)
    delete question_answer_url(@best_footballer, @answer), xhr: true
    assert_response :success
  end

  test "User can't delete other user answer" do
    sign_in users(:george)
    assert_raises Guardian::NotAuthorizedError do
      delete question_answer_url(@best_footballer, @answer), xhr: true
    end
  end
end
