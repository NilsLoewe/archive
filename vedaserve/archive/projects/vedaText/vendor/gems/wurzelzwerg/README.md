# Wurzelzwerg

Wurzelzwerg is the worker for VedaText and VedaScan.
It processes a amqp based task-queue and calls handlers to do the job.

Wurzelzwerg wraps the `amqp` and `bunny` gem and can be integrated with Rails.

## Configuration

The AMQP server can be configured by setting the `AMQP_URL` environment variable.
If the `AMQP_URL` variable is not set, `amqp://guest:guest@localhost/` will be
used as server, which is the RabbitMQ default configuration.

Wurzelzwerg will automatically create exchanged, bindings and queues.
These can be configured using a configuration DSL:

    wurzelzwerg = Wurzelzwerg.new.configure do
       queue 'my_queue', :key => 'message.key'
       handler 'my_queue', MyHandler
    end

## Specs

You can run the specs by executing

    bundle exec rake spec

## Credits

Inspired by the [Beetle](https://github.com/xing/beetle) design.
