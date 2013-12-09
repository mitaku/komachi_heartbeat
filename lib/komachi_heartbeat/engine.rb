module KomachiHeartbeat
  class Engine < ::Rails::Engine
    isolate_namespace KomachiHeartbeat

    config.heartbeat = KomachiHeartbeat::Config
  end
end
