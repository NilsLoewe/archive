require 'faye'

module VedaText
  class Faye < Faye::RackAdapter

    def initialize(rails_app)
      super(rails_app, :mount => '/bayeux', :timeout => 25)

      bind(:subscribe) do |client_id, channel|
        puts "[subscribe] #{client_id} -> #{channel}"
      end
    end

  end
end
