PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)


require 'simplecov'

SimpleCov.start do
  root(File.join(File.dirname(__FILE__), '../'))
  add_filter '/spec/'
end

require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  DataMapper.setup(:default, "abstract::")
  DataMapper::Logger.new($stdout, :all)
end

def app
  ##
  # You can handle all padrino applications using instead:
  #   Padrino.application
  Camilo::App.tap { |app|  }
end
