require 'spec_helper'

describe Api::HatsController do
  context "for user that has two hats" do
    let(:user) { create(:user) }
    let!(:first_hat) { FactoryGirl.create(:hat, user: user, title: "First hat") }
    let!(:second_hat) { FactoryGirl.create(:hat, user: user, title: "Second hat") }
    let(:other_hat) { create(:hat) }

    subject { user }

    describe "#index" do
      context "when authenticated as that user" do
        before { sign_in(user) }

        it "should return json of array with that hat" do
          get :index
          json_response.should == [{"id" => second_hat.id, "title" => second_hat.title, "description" => nil},
            {"id" => first_hat.id, "title" => first_hat.title, "description" => nil}]
        end
      end

      context "when not authenticated as that user" do
        it "should return error json with 401 HTTP status" do
          get :index, format: :json
          response.status.should == 401
          json_response.should == {'error' => 'You need to sign in or sign up before continuing.'}
        end
      end
    end

    describe "#create" do
      let(:post_create) do
        post :create, hat: {title: "My new hat"}, format: :json
      end

      context "when authenticated as that user" do
        before { sign_in(user) }

        it "should add the record to the database" do
          expect {
            post_create
          }.to change(Hat, :count).by(1)
        end

        it "should return 200 OK" do
          post_create
          response.should be_success
        end

        it "should return json of the just created record" do
          post_create
          json_response["id"].should == be_an(Integer)
          json_response["title"].should == "My new hat"
        end

        it "should raise ParameterMissing exception when hat param is missing" do
          expect {
            post :create
          }.to raise_error(ActionController::ParameterMissing)
        end

        it "should ignore unknown parameters" do
          post :create, hat: {title: "New Hat", foobar: 1234}
          response.should be_ok
        end
      end

      context "when not authenticated as that user" do
        it "should return HTTP 401 Unauthorized when trying to create a hat" do
          post_create
          response.status.should == 401
          json_response.should == {'error' => 'You need to sign in or sign up before continuing.'}
        end
      end
    end

    describe '#update' do
      let(:patch_update) do
        patch :update, id: first_hat.id, hat: {title: "Updated hat"}, format: :json
      end
      
      context "when authenticated as that user" do
        before { sign_in(user) }
        
        it "should update passed parameters of the given hat" do
          patch_update
          first_hat.reload.title.should == "Updated hat"
        end

        it "should return 200 OK" do
          patch_update
          response.should be_success
        end

        it "should raise RecordNotFound when trying to update non-existent hat" do
          expect {
            patch :update, id: 0,
              hat: {title: "Irrelevant name"}
          }.to raise_error(ActiveRecord::RecordNotFound)
        end

        it "should return HTTP 401 Unauthorized when trying to get a list of a another user" do
          patch :update, id: other_hat.id, format: :json
          response.status.should == 401
          json_response.should == {'error' => 'unauthorized'}
        end
      end

      context "when not authenticated as that user" do
        it "should return error json with 401 HTTP status" do
          patch :update, id: first_hat.id, format: :json
          response.status.should == 401
          json_response.should == {'error' => 'You need to sign in or sign up before continuing.'}
        end
      end
    end


    describe "#show" do
      context "when authenticated as that user" do
        before { sign_in(user) }

        it "should return json with that hat" do
          get :show, id: first_hat.id
          json_response.should == {"id" => first_hat.id, "title" => first_hat.title, "description" => nil }
        end

        it "should raise RecordNotFound when trying to get a non-existent hat" do
          expect {
            get :show, id: 0
          }.to raise_error(ActiveRecord::RecordNotFound)
        end

        it "should return HTTP 401 Unauthorized when trying to get a hat of a another user" do
          get :show, id: other_hat.id
          response.status.should == 401
          json_response.should == {'error' => 'unauthorized'}
        end
      end

      context "when not authenticated as that user" do
        it "should return error json with 401 HTTP status" do
          get :show, id: first_hat.id, format: :json
          response.status.should == 401
          json_response.should == {'error' => 'You need to sign in or sign up before continuing.'}
        end
      end
    end


    describe "#destroy" do
      let(:delete_destroy) do
        delete :destroy, id: second_hat.id
      end

      context "when authenticated as that user" do
        before { sign_in(user) }
      
        it "should remove a list from the database" do
          delete_destroy
          expect { second_hat.reload }.to raise_error(ActiveRecord::RecordNotFound)
        end

        it "should return 200 OK" do
          delete_destroy
          response.should be_success
        end

        it "should raise RecordNotFound when trying to destroy non-existent hat" do
          expect {
            delete :destroy, id: 0
          }.to raise_error(ActiveRecord::RecordNotFound)
        end

        it "should return HTTP 401 Unauthorized when trying to delete hat of another user" do
          delete :destroy, id: other_hat.id
          response.status.should == 401
          json_response.should == {'error' => 'unauthorized'}
        end
      end

      context "when not authenticated as that user" do
        it "should return error json with 401 HTTP status" do
          delete :destroy, id: second_hat.id, format: :json
          response.status.should == 401
          json_response.should == {'error' => 'You need to sign in or sign up before continuing.'}
        end
      end
    end
  end
end
