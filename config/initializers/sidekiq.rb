SIDEKIQ_CONFIG = ConfigLoader.load_yml_config('config/sidekiq.yml', Rails.env)

Sidekiq.configure_server do |config|
  config.redis = { :url => SIDEKIQ_CONFIG[:url] }
end

Sidekiq.configure_client do |config|
  config.redis = { :url => SIDEKIQ_CONFIG[:url] }
end

