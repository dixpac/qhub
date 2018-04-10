require "test_helper"

class FormHelperTest < ActionView::TestCase
  test "#form_errors prints each error in model" do
    question = Question.new
    refute question.valid?
    refute_empty question.errors

    output = form_errors(question)
    errors = question.errors

    errors.full_messages.each do |msg|
      assert_match /#{ ERB::Util.html_escape(msg) }/, output
    end
  end

  test "#form_errors prints nothing for valid model" do
    question = questions(:best_footballer)

    assert question.valid?
    assert_empty question.errors
    assert_nil form_errors(question)
  end
end
