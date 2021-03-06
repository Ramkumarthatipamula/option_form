require_relative 'boot'


require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'carrierwave'
require 'carrierwave/orm/activerecord'# Require the gems listed in Gemfile, including any gems
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OptionForm
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    Rails.application.config.assets.precompile += %w( certificate.js )
  end
end
