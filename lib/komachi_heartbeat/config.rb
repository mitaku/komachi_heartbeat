module KomachiHeartbeat
  class Config
    include ActiveSupport::Configurable
    config_accessor :application_version, :application_name, :db_check_enabled, :redis_check_enabled, :memcached_check_enabled, :database_class_names, :memcached_server_names, :redis_servers

    configure do |config|
      config.application_name = "Unknown"
      config.application_version = "Unknown"
      config.db_check_enabled = true
      config.database_class_names = ["ActiveRecord::Base"]

      config.redis_check_enabled = false
      config.redis_servers = [{host: "localhost", port: 6379, db: 0}]

      config.memcached_check_enabled = false
      config.memcached_server_names = ["localhost"]
    end
  end
end
