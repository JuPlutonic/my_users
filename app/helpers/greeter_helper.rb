# frozen_string_literal: true

module GreeterHelper
  # def formatted_time(time)
  #   time.strftime('%I:%M%p') # time string in AM/PM format
  # end

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
