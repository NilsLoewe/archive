unless defined?(Messenger)
  Messenger = Wurzelzwerg::Client.new

  Messenger.instance_eval do
    load "#{Rails.root}/config/wurzelzwerg.rb"
  end
end
