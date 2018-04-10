module MarkdownHelper
  def markdown(content)
    pipeline_context = { gmf: true }
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::SanitizationFilter,
    ], pipeline_context

    # We're ok calling html_safe here since we sanitized content throght SanitizationFilter
    pipeline.call(content)[:output].to_s.html_safe
  end
end
