require_relative('../../lib/warden/authentication/strategies/password')
require_relative('../../lib/warden/authentication/strategies/token')

Warden::Strategies.add(:password, Warden::Authentication::Strategies::Password)
Warden::Strategies.add(:token, Warden::Authentication::Strategies::Token)
