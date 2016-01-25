require_dependency "komachi_heartbeat/application_controller"

module KomachiHeartbeat
  class HeartbeatController < ApplicationController
    RED   = "#e05d44"
    GREEN = "#4c1"

    unless Rails.env.test?
      rescue_from Exception do |exception|
        @message = "NG"
        @badge_color = RED

        respond_to do |format|
          format.svg { render :index }
          format.any { head :internal_server_error }
        end
      end
    end

    def index
      db_connection_check if db_check?
      redis_connection_check if redis_check?
      memcached_connection_check if memcached_check?

      @message = "ok"
      @badge_color = GREEN

      respond_to do |format|
        format.svg { }
        format.any { render text: "heartbeat:ok", status: 200 }
      end
    end

    def version
      obj = {:name => application_name, :version => application_version, :revision => revision, :access => DateTime.now}

      render json: obj
    end

    private

    # ---- Database
    def db_check?
      !!KomachiHeartbeat.config.db_check_enabled
    end

    def db_connection_check
      connection_database_class_names.each do |klass|
        klass.constantize.connection.execute "SELECT * FROM schema_migrations LIMIT 1"
      end
    end

    def connection_database_class_names
      KomachiHeartbeat.config.database_class_names.presence || []
    end

    # ---- Redis
    def redis_check?
      defined?(Redis) && !!KomachiHeartbeat.config.redis_check_enabled
    end

    def redis_connection_check
      redis_servers.each do |hash|
        redis = Redis.new(hash)
        redis.ping
        redis.quit
      end
    end

    def redis_servers
      KomachiHeartbeat.config.redis_servers.presence || []
    end

    # ---- Memcached
    def memcached_server_names
      KomachiHeartbeat.config.memcached_server_names.presence || []
    end

    def memcached_connection_check
      memcached_server_names.each do |memcached_server_name|
        if defined?(MemCache)
          memcache = MemCache.new(memcached_server_name)
          memcache.stats
          memcache.reset
        elsif defined?(Dalli::Client)
          memcache = Dalli::Client.new(memcached_server_name)
          memcache.alive!
          memcache.reset
        end
      end
    end

    def memcached_check?
      (defined?(MemCache) || defined?(Dalli::Client)) && !!KomachiHeartbeat.config.memcached_check_enabled
    end

    def application_name
      KomachiHeartbeat.config.application_name
    end

    def application_version
      KomachiHeartbeat.config.application_version
    end

    def revision
      file = KomachiHeartbeat.config.revision_path
      file = file.call if file.is_a?(Proc)
      file = Pathname.new(file) unless file.is_a?(Pathname)
      if file.exist?
        file.read.chomp
      else
        "UNKNOWN"
      end
    end
  end
end
