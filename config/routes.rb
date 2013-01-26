KomachiHeartbeat::Engine.routes.draw do
  get "heartbeat", :to => "heartbeat#index"
  get "version", :to => "heartbeat#version"
end
