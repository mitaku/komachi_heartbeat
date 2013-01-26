Rails.application.routes.draw do

  mount KomachiHeartbeat::Engine => "/komachi_heartbeat"
end
