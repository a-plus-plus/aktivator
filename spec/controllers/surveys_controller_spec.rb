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
  render_views
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
    it "sends a list of surveys" do
      FactoryGirl.create_list(:survey, 10)

      get :index

      expect(response).to be_success            # test for the 200 status-code
      json.should have(10).items   
    end
  end

  describe "GET index not logged in" do 
    it "returns only published and finished" do
      sign_out :user

      survey = Survey.create! valid_attributes
      unpublished = FactoryGirl.create(:survey, status: "Unpublished")
      finished = FactoryGirl.create(:survey, status: "Finished")

      get :index
      expect(response).to be_success
      json.should have(2).items
      json.all? {|status| status.value?('Unpublished') }.should be_false
    end
  end  

  describe "GET show :id" do
    it "it returns the correct survey with paramater :id as JSON" do
      survey = Survey.create! valid_attributes

      get :show, {:id => survey.to_param}
      expect(response).to be_success

      json['title'].should == survey.title
      json['id'].should == survey.id
    end
  end
   
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Survey" do
        FactoryGirl.create(:tag, title: "Tag1")
        json = 
        { 
          :format => 'json', 
          :survey => { :title => "Survey123", :user_id => 1, :status => "Published",
          :questions_attributes => [{:title => "Question 1", :kind => "Checkbox", :options_attributes => [{:value => "Option 1"}]}],
          :tag_ids => [1] }
        }

        expect {
          post :create, json
        }.to change(Survey, :count).by(1)

        survey = assigns(:survey)
        expect(survey.title).to eq("Survey123")
        expect(survey.tags.first.title).to eq("Tag1")
        expect(survey.questions.first.title).to eq("Question 1")
        expect(survey.questions.first.options.first.value).to eq("Option 1")
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
        post :create, {:survey => { "title" => "invalid parameters" }}, valid_session
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
        Survey.any_instance.should_receive(:update).with({ "title" => "MyString", "tag_ids"=>[] })
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
