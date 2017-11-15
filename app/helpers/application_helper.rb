# frozen_string_literal: true

module ApplicationHelper
  def link_with_item(icon, path, options = {})
    title = options.delete(:title)
    link_to path, options do
      content_tag(:i, ' ' + title, class: "fa fa-#{icon} links")
    end
  end

  # Method used in check_user_name
  def user_or_email(object)
    if object.name.present?
      session[:user_name_pres] = object.name.to_s
    else
      before_at, = object.email.split(/@/)
      session[:user_name_pres] = before_at
    end
  end
end
