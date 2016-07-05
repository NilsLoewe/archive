require 'amqp'

module Wurzelzwerg
  class Subscriber

    def initialize(client)
      @client = client
      @exchanges = {}
      @queues = {}
    end

    def listen_queues
      AMQP.start(Wurzelzwerg.server_url) do |connection|
        channel = AMQP::Channel.new(connection)
        create_exchanges(channel)
        bind_queues(channel)
        subscribe_queues
      end
    end

    def create_exchanges(channel)
      @client.exchanges.each do |name, opts|
        @exchanges[name] ||= channel.send(opts[:type], name)
      end
    end

    def bind_queues(channel)
      @client.bindings.each do |queue_name, opts|
        @queues[queue_name] ||= begin
          routing_key   = opts.fetch(:key)
          exchange_name = opts.fetch(:exchange)
          durable_queue = opts.fetch(:durable)

          queue = channel.queue(queue_name, :durable => durable_queue)
          queue.bind(exchange(exchange_name), :routing_key => routing_key)
          queue
        end
      end
    end

    def subscribe_queues
      @client.handlers.each do |queue_name, clazz|
        queue(queue_name).subscribe do |payload|
          handler = clazz.new(payload)
          handler.process
        end
      end
    end

    def queue(name)
      @queues.fetch(name)
    end

    def exchange(name)
      @exchanges.fetch(name)
    end

  end
end
