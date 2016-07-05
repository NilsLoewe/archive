require File.expand_path('../../spec_helper', __FILE__)

describe Wurzelzwerg::Publisher do
  include ClientStubs

  let(:client)   { double('wurzelzwerg client') }
  let(:bunny)    { double('bunny') }
  let(:exchange) { double('bunny exchange') }
  let(:queue)    { double('bunny queue') }

  subject { described_class.new(client) }

  context 'initialization' do
    it 'should initialize and start the Bunny on first use' do
      Bunny.should_receive(:new).and_return(bunny)
      bunny.should_receive(:start)

      subject.bunny
    end

    it 'should hold the Bunny instance as a singleton' do
      subject.should_receive(:start_bunny).once.and_return(bunny)

      2.times do
        subject.bunny
      end
    end

    it 'should use the configured server url to start the connection' do
      url_stub = stub
      Wurzelzwerg.should_receive(:server_url).and_return(url_stub)
      Bunny.should_receive(:new).with(url_stub).and_return(bunny.as_null_object)

      subject.bunny
    end
  end

  context 'auto binding and create' do
    before(:each) do
      subject.stub(:bunny).and_return(bunny)

      client.stub(:message_known?).and_return(true)
      client.stub(:exchanges).and_return(exchanges_stub)
      client.stub(:bindings).and_return(bindings_stub)

      bunny.should_receive(:exchange).with('my_exchange', :type => :topic).once.and_return(exchange.as_null_object)
      bunny.should_receive(:queue).with('my_queue', :durable=> true).once.and_return(queue)
      queue.should_receive(:bind).with(exchange, :key => 'my.message').once
    end

    it 'should create exchanges and bind queues before publishing a message' do
      subject.publish('my.message', { :hello => :world }, :exchange => 'my_exchange')
    end

    it 'should remember which queue are binded and which exchanges created' do
      2.times do
        subject.publish('my.message', { :hello => :world }, :exchange => 'my_exchange')
      end
    end
  end

  context 'publishing' do
    before(:each) do
      subject.stub(:create_exchanges)
      subject.stub(:bind_queues)
    end

    it 'should raise an exception when message has no binding' do
      client.stub(:message_known?).and_return(false)
      unexpected_publishing = lambda { subject.publish('unknown.message', 'foobar', :exchange => 'my_exchange') }

      unexpected_publishing.should throw_symbol Wurzelzwerg::UnknownMessage
    end

    it 'should publish to Bunny exchange' do
      client.stub(:message_known?).and_return(true)

      subject.should_receive(:exchange).with('my_exchange').and_return(exchange)
      exchange.should_receive(:publish).with('message content', :key => 'routing.key')

      subject.publish('routing.key', 'message content', :exchange => 'my_exchange')
    end
  end

end
