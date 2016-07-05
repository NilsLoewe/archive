require 'bunny'

module Wurzelzwerg
  class Publisher

    def initialize(client)
      @client = client
      @exchanges = {}
      @queues = {}
    end

    def publish(message, data, opts = {})
      throw Wurzelzwerg::UnknownMessage unless @client.message_known?(message)
      create_exchanges
      bind_queues

      name = opts.fetch(:exchange)
      exchange(name).publish(data, :key => message)
    end

    def bunny
      @bunny ||= start_bunny
    end

    private

    def exchange(name)
      @exchanges.fetch(name)
    end

    def start_bunny
      Bunny.new(Wurzelzwerg.server_url).tap do |b|
        b.start
      end
    end

    def create_exchanges
      @client.exchanges.each do |name, opts|
        @exchanges[name] ||= bunny.exchange(name, :type => opts[:type])
      end
    end

    def bind_queues
      @client.bindings.each do |queue_name, opts|
        @queues[queue_name] ||= begin
          routing_key   = opts.fetch(:key)
          exchange_name = opts.fetch(:exchange)
          durable_queue = opts.fetch(:durable)

          queue = bunny.queue(queue_name, :durable => durable_queue)
          queue.bind(exchange(exchange_name), :key => routing_key)
          queue
        end
      end
    end

  end
end
