require "komachi_heartbeat/config"
require "komachi_heartbeat/engine"

module KomachiHeartbeat
  def self.config
    KomachiHeartbeat::Config.config
  end
end
