class ConfigLoader

  def self.load_yml_config(file, env)
    yaml_config = YAML.load_file( Rails.root + file )
    hash_config = HashWithIndifferentAccess.new(yaml_config)
    raise "Missing '#{env}' config in #{file}" if hash_config[env].blank?
    hash_config[env]
  end

end
