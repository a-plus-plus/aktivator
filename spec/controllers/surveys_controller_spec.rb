require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SurveysController do
  login_user

  # This should return the minimal set of attributes required to create a valid
  # Survey. As you add validations to Survey, be sure to
  # adjust the attributes here as well.
let(:valid_attributes) { FactoryGirl.build(:survey).attributes.symbolize_keys }  

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SurveysController. Be sure to keep this updated too.
  let(:valid_session) { {} }

before :each do
request.env["HTTP_ACCEPT"] = 'application/json' 
end
  
  describe "GET index" do 
    it "assigns all surveys as @surveys" do
      survey = Survey.create! valid_attributes
      get :index, {}, valid_session
      assigns(:surveys).should eq([survey])
    end
  end

  describe "GET not logged in" do 
    it "returns only published and finished" do
      sign_out :user

      survey = Survey.create! valid_attributes

      unpublished = Survey.create! valid_attributes
      unpublished.status = "Unpublished"
      unpublished.save

      finished = Survey.create! valid_attributes
      finished.status = "Finished"
      finished.save

      get :index, {}, valid_session
      assigns(:surveys).should eq([survey, finished])
      p "#{[survey, finished]}"
    end
  end  

  describe "GET show" do
    it "assigns the requested survey as @survey" do
      survey = Survey.create! valid_attributes
      get :show, {:id => survey.to_param}, valid_session
      assigns(:survey).should eq(survey)
    end
  end
   
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Survey" do
        expect {
          post :create, {:survey => valid_attributes}, valid_session
        }.to change(Survey, :count).by(1)
      end

      it "assigns a newly created survey as @survey" do
        post :create, {:survey => valid_attributes}, valid_session
        assigns(:survey).should be_a(Survey)
        assigns(:survey).should be_persisted
      end

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved survey as @survey" do
        # Trigger the behavior that occurs when invalid params are submitted
        Survey.any_instance.stub(:save).and_return(false)
        post :create, {:survey => { "title" => "invalid value" }}, valid_session
        assigns(:survey).should be_a_new(Survey)
      end

    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested survey" do
        survey = Survey.create! valid_attributes
        # Assuming there are no other surveys in the database, this
        # specifies that the Survey created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Survey.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => survey.to_param, :survey => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested survey as @survey" do
        survey = Survey.create! valid_attributes
        put :update, {:id => survey.to_param, :survey => valid_attributes.except(:id)}, valid_session
        assigns(:survey).should eq(survey)
      end

    end

    describe "with invalid params" do
      it "assigns the survey as @survey" do
        survey = Survey.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Survey.any_instance.stub(:save).and_return(false)
        put :update, {:id => survey.to_param, :survey => { "title" => "invalid value" }}, valid_session
        assigns(:survey).should eq(survey)
      end

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested survey" do
      survey = Survey.create! valid_attributes
      expect {
        delete :destroy, {:id => survey.to_param}, valid_session
      }.to change(Survey, :count).by(-1)
    end

    
  end

end
