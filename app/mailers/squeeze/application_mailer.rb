# frozen_string_literal: true

module Squeeze
  # Mailer base class
  class ApplicationMailer < ActionMailer::Base
    default from: 'from@example.com'
    layout 'mailer'
  end
end
