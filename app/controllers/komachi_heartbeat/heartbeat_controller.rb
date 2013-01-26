require_dependency "komachi_heartbeat/application_controller"

module KomachiHeartbeat
  class HeartbeatController < ApplicationController
    def index
      ActiveRecord::Base.connection.execute "SELECT * FROM `schema_migrations` LIMIT 1"
      head :ok
    end

    def version
      head :ok
    end
  end
end
