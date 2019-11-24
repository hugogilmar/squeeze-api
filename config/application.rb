# frozen_string_literal: true

require_relative('boot')
require_relative('../lib/rack/unauthorized')
require_relative('../lib/warden/authentication/strategies/password')
require_relative('../lib/warden/authentication/strategies/token')

require('rails')
# Pick the frameworks you want:
require('active_model/railtie')
require('active_job/railtie')
require('active_record/railtie')
# require('active_storage/engine')
require('action_controller/railtie')
require('action_mailer/railtie')
# require('action_mailbox/engine')
# require('action_text/engine')
require('action_view/railtie')
# require('action_cable/engine')
# require('sprockets/railtie')
require('rails/test_unit/railtie')

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Squeeze
  # Application class
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults(6.0)

    # Update autoload paths
    config.autoload_paths << "#{config.root}/lib"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # Warden middleware configuration
    config.middleware.use(Warden::Manager) do |manager|
      manager.default_strategies(:passworkd, :token)
      manager.failure_app = Rack::Unauthorized.new
    end
  end
end
