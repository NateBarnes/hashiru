# Load ACTV (A3PI gem) config
ACTV_CONFIG = ConfigLoader.load_yml_config('config/actv.yml', Rails.env)

ACTV.configure do |config|
  config.endpoint = ACTV_CONFIG[:host]
  config.api_key = ACTV_CONFIG[:api_key]
end

