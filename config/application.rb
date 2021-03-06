# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyUsers
  class Application < Rails::Application
    config.i18n.default_locale = :ru
    config.i18n.locale = :ru
    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 5.1
    # config.assets.initialize_on_precompile = false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       requests_specs: false,
                       controller_specs: true
      #g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
  end
end
