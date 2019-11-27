module Squeeze
  class UserMailer < ApplicationMailer
    def email_delivery_check(user)
      mail(to: user.email, subject: 'Email delivery check')
    end
  end
end
