require 'rails_helper'

RSpec.describe 'decisions/_form.haml' do
  it 'renders without error' do
    assign(:decision, create(:decision))
    render
  end
end
