# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module AmigoSecreto
  class Application < Rails::Application
  end
end
