$:.push File.expand_path('../../lib', __FILE__)
require 'wurzelzwerg'

# stub data for state in Wurzelzwerg::Client
module ClientStubs
  def exchanges_stub
    [
      ['my_exchange', { :type => :topic }]
    ]
  end

  def bindings_stub
    [
      ['my_queue', { :key => 'my.message', :durable => true, :exchange => 'my_exchange' }]
    ]
  end
end
