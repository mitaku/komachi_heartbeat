require_dependency "komachi_heartbeat/application_controller"

module KomachiHeartbeat
  class HeartbeatController < ApplicationController
    def index
      ActiveRecord::Base.connection.execute "SELECT * FROM `schema_migrations` LIMIT 1"

      head :ok
    end

    def version
      obj = {:name => application_name, :version => application_version, :access => DateTime.now}

      render json: obj
    end


    private
    def application_name
      KomachiHeartbeat.application_name || "Unknown"
    end

    def application_version
      KomachiHeartbeat.application_version || "Unknown"
    end
  end
end
