require "test_helper"

class MarkdownHelperTest < ActionView::TestCase
  test "#markdown parses markdown and outputs html" do
    content = "**bold**"
    output = markdown(content)
    assert_equal "<p><strong>bold</strong></p>", output
  end

  test "#markdown outputs sanitized html" do
    content = "<script>alert</script>"
    output = markdown(content)
    assert_equal "&lt;script&gt;alert&lt;/script&gt;", output
  end
end
