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
  s.summary     = "Rails Application Hertbeat Check Engine."
  s.description = "Alive Monitoring of Application Server and DB Server."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 3.2.11"
  s.add_dependency "redis"
  s.add_dependency "memcache-client"

  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "spork"
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'growl'
end
