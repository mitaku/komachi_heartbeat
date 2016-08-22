KomachiHeartbeat::Engine.routes.draw do
  get "heartbeat", :to => "heartbeat#index", defaults: { format: "txt" }
  get "version", :to => "heartbeat#version"

  get "stats/worker", :to => "stats#worker"
end
