# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'mail@app___.mailgun.org'
  layout 'mailer'
end
