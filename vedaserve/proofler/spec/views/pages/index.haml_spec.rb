require 'rails_helper'

RSpec.describe 'pages/index.haml' do
  it 'renders without error' do
    assign(:decision, create(:decision))
    render
  end
end
