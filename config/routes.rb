KomachiHeartbeat::Engine.routes.draw do
  get "heartbeat", :to => "heartbeat#index"
  get "version", :to => "heartbeat#version"

  get "stats/worker", :to => "stats#worker"
end
