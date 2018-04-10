module FormHelper
  def form_errors(model)
    return unless model.errors.any?

    content_tag(:div, class: 'alert alert-danger', id: 'error_explanation') do
      content_tag(:ul) do
        model.errors.full_messages.map { |msg| content_tag(:li, msg) }.join.html_safe
      end
    end
  end
end
