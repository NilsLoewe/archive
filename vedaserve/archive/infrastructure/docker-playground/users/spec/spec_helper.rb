require_relative '../app.rb'
require 'sinatra'
require 'rack/test'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.default_formatter = :documentation
  conf.color = true
  def app
    App
  end
end
