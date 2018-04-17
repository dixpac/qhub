require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:best_footballer)
  end

  test "User can ask new question" do
    sign_in users(:jerry)
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

  test "User can't ask question without title and content" do
    sign_in users(:jerry)
    post questions_url, params: { question: { title: "", content: "" } }

    assert_select "li", "Title can't be blank"
    assert_select "li", "Content can't be blank"
  end

  test "User can edit his question" do
    sign_in users(:jerry)
    patch question_url(@question), params: { question: { title: "new title" } }

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h3", "new title"
  end

  test "User can't edit question if he is not creator" do
    sign_in users(:george)
    assert_raises Guardian::NotAuthorizedError do
      get edit_question_url(@question)
    end
  end

  test "User can delete his question" do
    sign_in users(:jerry)

    delete question_url(@question)

    assert_redirected_to questions_url
  end

  test "User can't delete other user question" do
    sign_in users(:george)
    assert_raises Guardian::NotAuthorizedError do
      delete question_url(@question)
    end
  end

  test "Guest can't access questions" do
    get questions_url
    assert_redirected_to new_user_session_path
  end

  test "Guest can't create questions" do
    get new_question_url
    assert_redirected_to new_user_session_path
  end

  test "Guest can't edit question" do
    get edit_question_url(@question)
    assert_redirected_to new_user_session_path
  end

  test "Guest can't delete question" do
    delete question_url(@question)
    assert_redirected_to new_user_session_path
  end
end
