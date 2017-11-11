# frozen_string_literal: true

#Authorization, mb need refactoring using CanCanCan gem
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # helper_methods :have_rights_for?, :under_admin?

  # def abort_if_non_authorized(object)
  #   unless object.user == current_user
  #   unless have_rights_for?(object)
  #     redirect_to :root, alert: "У вас нет прав для выполнения этого действия"
  #   end
  # end

  # def under_admin?
  #   current_user && current_user.admin?
  # end

  # def have_rights_for?(object)
  #   object && current_user && (current_user.author_of?(object) || current_user.admin?)
  # end
end
