# frozen_string_literal: true

Rails.application.config.active_job.queue_adapter = :sidekiq

Sidekiq.configure_server do |config|
  config.redis = { url: URI.join(ENV.fetch('REDIS_URL'), '/0').to_s }
end

Sidekiq.configure_client do |config|
  config.redis = { url: URI.join(ENV.fetch('REDIS_URL'), '/0').to_s }
end
