# frozen_string_literal: true

# Authorization, mb need refactoring using CanCanCan gem
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :set_users
  helper_method :have_rights_for?, :under_admin?

  protected

  def abort_if_non_authorized(object)
    abort unless authorized?(object)
  end

  def under_admin?
    current_user && current_user.admin?
  end

  # Current_user can only edit his profile
  def authorized?(object)
    object && current_user && (
                         current_user.author_of?(object) || current_user.admin?)
  end

  private

  # def set_users
  #   @users = User.all
  # end

  def abort
    redirect_to :root, alert: 'У вас нет прав для выполнения этого действия'
  end
end
