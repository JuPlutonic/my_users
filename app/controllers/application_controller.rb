# frozen_string_literal: true

# Authorization, mb need refactoring using CanCanCan gem
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_admin_users, :visited
  helper_method :authorized?, :under_admin?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password current_password admin])
  end

  def abort_if_non_authorized(object)
    abort unless authorized?(object)
  end

  def under_admin?
    current_user&.admin?
  end

  # Current_user can only edit his profile
  def authorized?(object)
    object && current_user && (
                         current_user.author_of?(object) || current_user.admin?)
  end

  private

  def set_admin_users
    @admin_users = User.all.admins
  end

  # Should work only if user allowed cookies
  def visited
    session[:times_displayed] ||= 0
    session[:times_displayed] += 1
  end

  def abort
    redirect_to :root, alert: 'У вас нет прав для выполнения этого действия'
  end
end
