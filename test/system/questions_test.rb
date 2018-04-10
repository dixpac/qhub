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
end
