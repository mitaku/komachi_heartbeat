require "komachi_heartbeat/config"
require "komachi_heartbeat/engine"
require "komachi_heartbeat/railtie"

module KomachiHeartbeat
  def self.config
    KomachiHeartbeat::Config.config
  end
end
