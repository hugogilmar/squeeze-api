# frozen_string_literal: true

module Squeeze
  # User mailer
  class UserMailer < ApplicationMailer
    # Email delivery test
    def email_delivery_check(user)
      mail(to: user.email, subject: 'Email delivery check')
    end
  end
end
