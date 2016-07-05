$:.push File.expand_path("../lib", __FILE__)

require 'wurzelzwerg/version'

Gem::Specification.new do |s|
  s.name = 'wurzelzwerg'
  s.version = Wurzelzwerg::VERSION
  s.platform = Gem::Platform::RUBY
  s.summary = 'Worker-queue for the vedaserve products'
  s.authors = ['Jan Ahrens']
  s.email   = ['jan.ahrens@gmail.com']
  s.homepage = 'http://github.com/LoeweSoftware/wurzelzwerg'

  # for the subscriber
  s.add_dependency 'amqp'

  # for the publisher
  s.add_dependency 'bunny'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'

  s.require_paths = ['lib']
end
