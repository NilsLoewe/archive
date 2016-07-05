require "rails_helper"

RSpec.describe "routes for static pages", type: 'routing' do
  it "routes / to the pages controller" do
    expect(get("/"))
      .to route_to("pages#index")
  end
end
