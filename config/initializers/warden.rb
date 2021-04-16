# frozen_string_literal: true

require 'squeeze/warden/authentication/strategies/password'
require 'squeeze/warden/authentication/strategies/token'

Warden::Strategies.add(:password, Squeeze::Warden::Authentication::Strategies::Password)
Warden::Strategies.add(:token, Squeeze::Warden::Authentication::Strategies::Token)
