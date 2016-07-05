require 'wurzelzwerg/client'
require 'wurzelzwerg/handler'
require 'wurzelzwerg/subscriber'
require 'wurzelzwerg/publisher'

module Wurzelzwerg

  # Remember: don't put a slash at the end of this URL
  DEFAULT_URL = 'amqp://guest:guest@localhost'
  
  def self.server_url
    ENV['AMQP_URL'] || Wurzelzwerg::DEFAULT_URL
  end

  class UnknownMessage < Exception; end

end
