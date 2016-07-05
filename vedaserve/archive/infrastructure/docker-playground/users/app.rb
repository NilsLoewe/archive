require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'sinatra/advanced_routes'
require 'sinatra/respond_with'

require_relative 'lib/init'

class User < ActiveRecord::Base
end

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::AdvancedRoutes
  register Sinatra::RespondWith
  register Sinatra::APICallDSL

  set :bind, '0.0.0.0'

  get '/hi' do
    'Hi'
  end

  api_call do
    post '/users'
    parameters do
      email format: { with: /\A.*@.*\z/, message: 'Please specify a valid email' }
      name presence: { message: 'Please specify a name' }
    end
    code do
      status 201
      {foo: 'bar'}
    end
  end
end
