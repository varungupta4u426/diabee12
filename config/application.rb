require_relative 'boot'

require 'rails/all'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Diabee
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    # Precompile additional assets
    config.assets.precompile += %w( .svg .eot .woff .ttf .png .jpg .gif .woff2) 

    config.assets.paths << Rails.root.join("app", "assets", "fonts")

  end
end
