# frozen_string_literal: true

require 'jwt'

module TokenTestHelpers
  def bearer_token(user)
    "Bearer #{generate_authentication_token(user)}"
  end

  def generate_authentication_token(user)
    JWT.encode(authentication_token_payload(user), authentication_token_secret, authentication_token_algorithm)
  end

  def authentication_token_payload(user)
    expires_at = Time.zone.now + 24.hours
    issued_at = Time.zone.now

    { email: user.email, exp: expires_at.to_i, iat: issued_at.to_i }
  end

  def authentication_token_secret
    Rails.application.secrets.secret_key_base.to_s
  end

  def authentication_token_algorithm
    'HS256'
  end
end
