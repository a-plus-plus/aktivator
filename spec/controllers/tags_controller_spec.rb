require 'spec_helper'

describe TagsController do
	render_views
	login_user

  # This should return the minimal set of attributes required to create a valid
  # Survey. As you add validations to Survey, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.build(:tag).attributes.symbolize_keys }  

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SurveysController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before :each do
  	request.env["HTTP_ACCEPT"] = 'application/json' 
 end


#TODO: get uses authenticate_user_from_token!, user_logged_in doesn't work here!
describe "GET index logged in" do 
 	it "sends a list of all tags" do
 		tags = FactoryGirl.create_list(:tag, 10)
 		get :index
 		expect(response).to be_success
 		json.should have(10).items   
  end
end

describe "GET show/:id" do 
 	it "sends tag to corresponding id " do
 		tag = FactoryGirl.create(:tag)
 		get :show, {:id => tag.to_param}
 		expect(response).to be_success

 		json['title'].should == tag.title
 		json['id'].should == tag.id 
  end
end
 

end

