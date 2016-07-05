module Wurzelzwerg
  class Client

    DEFAULT_EXCHANGE_OPTS = {:type => :topic}.freeze
    DEFAULT_QUEUE_OPTS = {:durable => true}.freeze

    attr_reader :exchanges
    attr_reader :bindings
    attr_reader :handlers

    def initialize
      @exchanges = {}
      @bindings = {}
      @handlers = {}
    end

    def configure(options={}, &block)
      configurator = Configurator.new(self, options)
      configurator.instance_eval(&block)
    end

    class Configurator
      def initialize(client, options)
        @client = client
        @options = options
      end

      def method_missing(method, *args, &block)
        # we can't use `binding' because it's a known Ruby kernel method
        super unless %w(queue handler).include?(method.to_s)
        options = @options.merge(args.last.is_a?(Hash) ? args.pop : {})
        @client.send("register_#{method}", *(args + [options]), &block)
      end
    end

    # stolen from beetle
    def load(glob)
      b = binding
      Dir[glob].each do |f|
        eval(File.read(f), b, f)
      end
    end

    def register_exchange(name, opts = {})
      @exchanges[name] ||= DEFAULT_EXCHANGE_OPTS.merge(opts)
    end


    def register_binding(queue_name, opts = {})
      key      = opts.fetch(:key)
      exchange = opts.fetch(:exchange)

      register_exchange(exchange)

      options = DEFAULT_QUEUE_OPTS.merge(:exchange => exchange, :key => key)
      @bindings[queue_name] ||= options
    end

    alias :register_queue :register_binding

    def register_handler(queue_name, clazz, opts={})
      @handlers[queue_name] ||= clazz
    end

    def listen_queues
      subscriber.listen_queues
    end

    def publish(message, data, opts = {})
      publisher.publish(message, data, opts)
    end

    def message_known?(name)
      @bindings.any? do |queue_name, opts|
        opts.fetch(:key) == name
      end
    end

    private

    def subscriber
      @subscriber ||= Wurzelzwerg::Subscriber.new(self)
    end

    def publisher
      @publisher ||= Wurzelzwerg::Publisher.new(self)
    end

  end
end
