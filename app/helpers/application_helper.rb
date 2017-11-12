# frozen_string_literal: true

module ApplicationHelper
  def link_with_item(icon, path, options = {})
    title = options.delete(:title)
    link_to path, options do
      content_tag(:i, title, class: "fa fa-#{icon}")
    end
  end
end
