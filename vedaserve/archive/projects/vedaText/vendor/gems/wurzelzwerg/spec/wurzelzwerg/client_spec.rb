require File.expand_path('../../spec_helper', __FILE__)

describe Wurzelzwerg::Client do
  subject { described_class.new }

  describe 'configuration' do
    it 'should register exchanges' do
      expect {
        subject.register_exchange('foobar')
      }.to change(subject.exchanges, :count).by(1)
    end

    it 'should skip already registered exchanges' do
      subject.register_exchange('foobar')
      expect {
        subject.register_exchange('foobar', :silly_option => :silly_value)
      }.not_to change { subject.exchanges }
    end

    it 'should register bindings' do
      expect {
        subject.register_binding('foobar', :key => 'binding.key', :exchange => 'exchange')
      }.to change(subject.bindings, :count).by(1)
    end

    it 'should register exchanges when registering binding' do
      expect {
        subject.register_binding('foobar', :key => 'binding.key', :exchange => 'exchange')
      }.to change(subject.exchanges, :count).by(1)
    end

    it 'should skip already registered bindings' do
      opts = { :key => 'binding.key', :exchange => 'exchange' }
      subject.register_binding('foobar', opts)

      expect {
        subject.register_binding('foobar', opts.merge(:exchange => 'other_exchange'))
      }.not_to change {subject.bindings}
    end

    it 'should register handler' do
      expect {
        subject.register_handler('my_queue', double('handler'))
      }.to change(subject.handlers, :count).by(1)
    end

    it 'should skip already registered handlers' do
      subject.register_handler('my_queue', double('handler'))

      expect {
        subject.register_handler('my_queue', double('handler'))
      }.not_to change(subject.handlers, :count)
    end
  end

  describe 'convinient configuration' do
    it 'should provide shortcut for handler registration' do
      handler_double = double('handler')
      expect {
        subject.configure { handler 'queue_name', handler_double  }
      }.to change(subject.handlers, :count).by(1)
    end

    it 'should provide shortcut for queue registration' do
      expect {
        subject.configure { queue 'queue_name', :key => 'routing.key', :exchange => 'foo' }
      }.to change(subject.bindings, :count).by(1)
    end

    it 'should pass around know options to registration methods' do
      handler_double = double('handler')

      subject.should_receive(:register_handler).with('foo_queue', handler_double, :global => :options)

      subject.configure :global => :options do
        handler 'foo_queue', handler_double
      end
    end
  end

  describe 'work' do
    it 'should delegate queue listening to the subscriber' do
      subject.send(:subscriber).should_receive(:listen_queues)
      subject.listen_queues
    end

    it 'should delegate publishing to the publisher' do
      subject.send(:publisher).should_receive(:publish).with('message', 'data', :opts => 123)
      subject.publish('message', 'data', :opts => 123)
    end

    it 'should know what messages are configured' do
      subject.register_binding('my_queue', :key => 'my.message', :exchange => 'any_exchange')

      subject.message_known?('my.message').should be_true
      subject.message_known?('unknown.message').should be_false
    end
  end

end
