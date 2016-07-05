require 'rails_helper'

RSpec.describe 'decisions/new.haml' do
  it 'renders without error' do
    assign(:decision, create(:decision))
    render
  end
end
