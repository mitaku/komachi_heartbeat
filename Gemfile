source "http://rubygems.org"

# Declare your gem's dependencies in komachi_heartbeat.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'

# nokogiri v1.7.0 requires Ruby version >= 2.1.0
if Gem::Version.create(RUBY_VERSION.dup) < Gem::Version.create("2.1.0")
  gem "nokogiri", "< 1.7.0"
end
