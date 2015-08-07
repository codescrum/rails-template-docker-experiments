require 'sidekiq/api'
redis_url = Rails.env.development? ? 'redis://127.0.0.1:6379' : "redis://#{ENV['REDIS_SERVICE_HOST']}:#{ENV['REDIS_SERVICE_PORT']}"
redis_config = { url: redis_url, namespace: 'sidekiq' }

Sidekiq.configure_server do |config|
  config.redis = redis_config
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end
