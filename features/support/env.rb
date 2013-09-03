require File.expand_path(File.dirname(__FILE__) + "/../../config/boot")


require 'capybara/cucumber'
require 'rspec/expectations'
require 'simplecov'

SimpleCov.start

ENV['HOST_URL'] = "http://localhost"
##
# You can handle all padrino applications using instead:
#   Padrino.application
DataMapper.auto_migrate!
Capybara.default_driver = :selenium
Capybara.app = Camilo::App.tap { |app|  }
