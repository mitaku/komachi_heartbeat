module KomachiHeartbeat
  class Engine < ::Rails::Engine
    isolate_namespace KomachiHeartbeat

    config.komachi_heartbeat = KomachiHeartbeat
  end
end
