Rails.application.routes.draw do

  mount KomachiHeartbeat::Engine => "/ops"
end
