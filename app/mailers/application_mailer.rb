# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'Andrew <from@example.com>'
  layout 'mailer'
end
