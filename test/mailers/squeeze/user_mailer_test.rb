# frozen_string_literal: true

require('test_helper')

module Squeeze
  class UserMailerTest < ActionMailer::TestCase
    def setup
      @user = FactoryBot.create(:user)
    end

    test 'email delivery check' do
      email = UserMailer.email_delivery_check(@user).deliver_now
      assert_not ActionMailer::Base.deliveries.empty?
      assert_equal [ENV['MAILER_FROM']], email.from
      assert_equal [@user.email], email.to
    end
  end
end
