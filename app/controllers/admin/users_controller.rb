# frozen_string_literal: true

class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to [:admin, @user], notice: 'Пользователь обновлён.'
    else
      flash.now[:alert] = 'Пользователь не был обновлён.'
      render :edit
    end
  end

  def destroy
    @user.destroy
    if @user.destroyed?
      redirect_to users_url, notice: 'Пользователь удалён.'
    else
      flash.now[:alert] = 'Пользователь не был удалён.'
      redirect_to users_url
    end
  end

  private

  def set_user
      @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin)
  end
end
