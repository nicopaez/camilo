source 'https://rubygems.org'

# Distribute your app as a gem
# gemspec

# Server requirements
gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'
gem 'omniauth'
gem 'omniauth-twitter', :github => 'arunagw/omniauth-twitter'

# Component requirements
gem 'googl'
gem 'slim'
gem 'haml'
gem 'pg', :group => 'production'
gem 'dm-postgres-adapter', :group => 'production'
gem 'dm-validations'
gem 'dm-timestamps'
gem 'dm-migrations'
gem 'dm-constraints'
gem 'dm-aggregates'
gem 'dm-types'
gem 'dm-core'
gem 'dm-ar-finders'
gem 'tilt', '1.3.7'

# Test requirements
group :test do
	gem 'dm-sqlite-adapter'
	gem 'rspec'
	gem 'rspec_junit_formatter'
	gem 'capybara'
	gem "selenium-webdriver", "~> 2.35.0"
	gem 'cucumber'
	gem 'simplecov'
	gem 'rack-test', :require => 'rack/test'
end

group :development do
	gem 'debugger'
end

# Padrino Stable Gem
gem 'padrino', '0.11.1'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.11.1'
# end
