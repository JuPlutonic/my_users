# frozen_string_literal: true

class GreeterController < ApplicationController
  def hello
    @i18n_hello = 'Здравствуйте, ' # Greetings,
    @name = 'Незарегистрированный пользователь '
    @i18n_time_now = '  Текущее время ' # The time now is
    @i18n_viewed1 = 'Данная страница показана ' # This page has been viewed
    @i18n_viewed2 = ' раз' # time(s)
    @time = Time.zone.now.to_s
    @times_displayed ||= 0 # Should work only in gaps of one request
    @times_displayed += 1
    @to_s_times_displayed = @times_displayed.to_s
    @i18n_goodbye = ' До свидания' # Goodbye
  end

  def goodbye
    @name = 'Незарегистрированный пользователь'
    @i18n_goodbye = 'До свидания ' # Bye
  end
end
