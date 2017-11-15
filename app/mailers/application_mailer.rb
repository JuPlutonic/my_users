# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'mail@sandbox3ba1fbef71ca4bd4ae1bd43528b36543.mailgun.org'
  layout 'mailer'
end
