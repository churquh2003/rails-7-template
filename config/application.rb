require_relative "boot"

require "rails/all"
require "dotenv/load"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsTemplate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Add any lib directories to autoload paths
    config.autoload_paths += %W(#{config.root}/lib)

    # Generators configurations
    config.generators do |g|
      g.test_framework nil
      g.factory_bot false
      g.scaffold_stylesheet false
      g.stylesheets false
      g.javascripts false
      g.helper false
    end

    # Security and ActiveRecord Defaults
    config.action_controller.default_protect_from_forgery = false
    config.active_record.belongs_to_required_by_default = false

    # Don't generate system test files
    config.generators.system_tests = nil

    # Load Google credentials from environment variables
    if ENV['GOOGLE_CREDENTIALS_JSON'].present?
      google_credentials = ENV['GOOGLE_CREDENTIALS_JSON']
      File.write('google_credentials.json', google_credentials)
      ENV['GOOGLE_CREDENTIALS'] = 'google_credentials.json'
    else
      Rails.logger.warn("Google credentials are not set. Gmail API integration may not work.")
    end

    # AI Integration Configuration (OpenAI)
    config.after_initialize do
      if ENV['OPENAI_API_KEY'].nil?
        Rails.logger.warn("OpenAI API key is not set. AI features will not work.")
      end
    end
  end
end
