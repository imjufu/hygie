# frozen_string_literal: true

ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  # Remove Rails field_with_errors wrapper
  html_tag
end
