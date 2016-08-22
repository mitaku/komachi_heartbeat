shared_context :setup_cotroller, type: :controller do
  routes { KomachiHeartbeat::Engine.routes }
end
