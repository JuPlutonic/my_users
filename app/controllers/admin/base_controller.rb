# frozen_string_literal: true

# Will be changed by CanCan (gem for Authorization) implementation
class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  layout 'admin'

  protected

  def require_admin
    return if under_admin?
    flash[:error] = 'У вас нет прав на просмотр этой страницы'
    redirect_to root_path
  end
end
