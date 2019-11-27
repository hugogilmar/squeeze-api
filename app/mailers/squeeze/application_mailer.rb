# frozen_string_literal: true

module Squeeze
  # Mailer base class
  class ApplicationMailer < ActionMailer::Base
    default from: ENV['MAILER_FROM']
    layout 'mailer'
  end
end
