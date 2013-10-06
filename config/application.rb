require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Sorteringsguide
  class Application < Rails::Application
    config.time_zone = 'Copenhagen'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    #config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :da

    # Enable the asset pipeline
    config.assets.enabled = true
    config.assets.version = '1.0'

    # Add the fonts path
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')

    # Precompile additional assets
    config.assets.precompile += %w( *.svg *.eot *.woff *.ttf )
    config.assets.precompile += %w( *.png *.jpg *.jpeg *.gif )
  end
end
