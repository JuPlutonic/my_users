class Admin::WelcomeController < Admin::BaseController
  def index
    @users_count = User.count
  end
end
