$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "komachi_heartbeat/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "komachi_heartbeat"
  s.version     = KomachiHeartbeat::VERSION
  s.authors     = ["Takumi MIURA"]
  s.email       = ["mitaku1104@gmail.com"]
  s.homepage    = "https://github.com/mitaku/komachi_heartbeat"
  s.summary     = "Rails Application Heartbeat Check Engine."
  s.description = "Alive Monitoring of Application Server and DB Server."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.1.0"

  s.add_development_dependency "redis"
  s.add_development_dependency "memcache-client"
  s.add_development_dependency "dalli"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.5.1"
  s.add_development_dependency "rspec-its"
  s.add_development_dependency "spork"
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'growl'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-nav'
  s.add_development_dependency 'mock_redis'
  s.add_development_dependency 'test-unit'
  s.add_development_dependency 'sidekiq', '< 5.0.0' # sidekiq 5.x+ requires MRI 2.2.2+
end
