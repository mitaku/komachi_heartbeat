Rails.application.routes.draw do

  mount KomachiHeartbeat::Engine => "/opt"
end
