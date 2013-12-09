require_dependency "komachi_heartbeat/application_controller"

module KomachiHeartbeat
  class HeartbeatController < ApplicationController
    def index
      db_connection_check if db_check?
      redis_connection_check if redis_check?
      memcached_connection_check if memcached_check?

      head :ok
    end

    def version
      obj = {:name => application_name, :version => application_version, :access => DateTime.now}

      render json: obj
    end

    private
    def redis_connection_check
      c = Redis::Client.new
      c.connect
      raise "Redis connection failed" unless c.connected?
      c.disconnect
    end

    def db_connection_check
      connection_database_class_names.each do |klass|
        klass.constantize.connection.execute "SELECT * FROM `schema_migrations` LIMIT 1"
      end
    end

    def memcached_connection_check
      MemCache.new(memcached_server_name).stats
    end

    def memcached_check?
      defined?(MemCache) && !!KomachiHeartbeat.config.memcached_check_enabled
    end

    def db_check?
      !!KomachiHeartbeat.config.db_check_enabled
    end

    def redis_check?
      defined?(Redis) && !!KomachiHeartbeat.config.redis_check_enabled
    end

    def connection_database_class_names
      KomachiHeartbeat.config.database_class_names.presence || ["ActiveRecord::Base"]
    end

    def memcached_server_name
      KomachiHeartbeat.config.memcached_server
    end

    def application_name
      KomachiHeartbeat.config.application_name
    end

    def application_version
      KomachiHeartbeat.config.application_version
    end
  end
end
