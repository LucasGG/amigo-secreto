# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module AmigoSecreto
  # Base application.
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators do |generators|
      generators.test_framework :rspec
      generators.factory_bot true
    end
  end
end
