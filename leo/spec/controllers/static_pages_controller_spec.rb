require 'spec_helper'

describe StaticPagesController do
  let(:user) { create(:user) }

  describe "#index" do
    it "should render when user is not signed in" do
      get :index
      response.should be_ok
      response.should render_template('index')
    end

    it "should redirect to the overview if signed in" do
      sign_in(user)
      get :index
      response.should redirect_to(overview_path)
    end
  end
end
