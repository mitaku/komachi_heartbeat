module KomachiHeartbeat
  class Config
    include ActiveSupport::Configurable
    config_accessor :application_version, :application_name, :db_check_enabled, :redis_check_enabled, :memcached_check_enabled, :database_class_names, :memcached_server

    configure do |config|
      config.application_name = "Unknown"
      config.application_version = "Unknown"
      config.db_check_enabled = true
      config.database_class_names = ["ActiveRecord::Base"]

      config.redis_check_enabled = false

      config.memcached_check_enabled = false
      config.memcached_server = "localhost"
    end
  end
end
