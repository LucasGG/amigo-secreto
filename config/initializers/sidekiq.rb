# frozen_string_literal: true

Rails.application.config.active_job.queue_adapter = :sidekiq
Rails.application.config.active_job.queue_name_prefix = "amigo_secreto_#{Rails.env}"

Sidekiq.configure_server do |config|
  config.redis = { url: URI.join(ENV.fetch('REDIS_URL'), '/0').to_s }
end

Sidekiq.configure_client do |config|
  config.redis = { url: URI.join(ENV.fetch('REDIS_URL'), '/0').to_s }
end
