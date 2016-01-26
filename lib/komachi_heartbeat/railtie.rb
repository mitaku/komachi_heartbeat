module KomachiHeartbeat
  class Railtie < ::Rails::Railtie
    initializer "komachi_heartbeat.register_mime" do
      unless Mime[:svg]
        Mime::Type.register "image/svg+xml", :svg
      end
    end
  end
end
