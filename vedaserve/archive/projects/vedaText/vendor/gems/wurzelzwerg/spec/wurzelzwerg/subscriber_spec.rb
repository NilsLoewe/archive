require File.expand_path('../../spec_helper', __FILE__)

describe Wurzelzwerg::Subscriber do
  include ClientStubs

  let(:client) { double(:client) }
  let(:queue)  { double(:queue)  }
  subject { described_class.new(client) }

  class Handler < Wurzelzwerg::Handler
    def process
      check_that_correct_message_arrived(message)
    end

    def check_that_correct_message_arrived(message); end
  end

  it 'should initialize the configured handler for each received message' do
    subject.stub(:queue).and_return(queue)

    client.stub(:handlers).and_return [['my_queue', Handler]]
    Handler.any_instance
      .should_receive(:check_that_correct_message_arrived)
      .with('my message')

    queue.should_receive(:subscribe).and_yield('my message')

    subject.subscribe_queues
  end

  context 'auto binding and creating' do
    let(:channel)  { double('channel') }
    let(:queue)    { double('queue') }
    let(:exchange) { double('exchange') }

    before(:each) do
      client.stub(:exchanges).and_return(exchanges_stub)
      client.stub(:bindings).and_return(bindings_stub)
      client.stub(:handlers).and_return([['my_queue', Handler]])

      channel.should_receive(:topic).once.with('my_exchange').and_return(exchange)
      channel.should_receive(:queue).once.with('my_queue', :durable => true).and_return(queue)
      queue.should_receive(:bind).once.with(exchange, :routing_key => 'my.message')
    end

    it 'should create exchanges and bind queues before waiting for messages' do
      AMQP.should_receive(:start).and_yield(double)
      AMQP::Channel.should_receive(:new).and_return(channel)

      queue.should_receive(:subscribe).once
      subject.listen_queues
    end

    it 'should remember which queues are binded and which exchanges created' do
      AMQP.should_receive(:start).twice.and_yield(double)
      AMQP::Channel.should_receive(:new).twice.and_return(channel)

      queue.should_receive(:subscribe).twice

      # see the `once' constraint in the before-each block
      2.times do
        subject.listen_queues
      end
    end
  end
end
