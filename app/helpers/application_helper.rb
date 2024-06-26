# frozen_string_literal: true

module ApplicationHelper
  def field_with_error(model, attribute, &)
    css_class = []
    css_class << 'invalid' if model.errors[attribute].any?
    form_field = capture(&)
    tag.div(class: css_class) do
      form_field + tag.p(model.errors[attribute].join(', '), class: 'error')
    end
  end
end
