require_relative 'spec_helper'

describe 'hello world spec' do
  context 'polite app' do
    before(:all) { get '/hi' }
    it('says hi') { expect(last_response.body).to eq('Hi') }
    it('it okay') { expect(last_response).to be_ok }
  end
end
