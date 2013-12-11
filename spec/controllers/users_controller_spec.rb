require 'spec_helper'

describe UsersController do
	render_views

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SurveysController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before :each do
  	request.env["HTTP_ACCEPT"] = 'application/json' 
  end


  describe "Create new user with valid params" do 
    it "registers to the database" do
      post :create, {:user => {name: "Testman", email: "testman@test.com", password: "12345678"}}, valid_session
      assigns(:user).should be_a(User)
      assigns(:user).should be_persisted
    end
  end

  describe "Create new user with invalid params" do 
    it "rejects the the request " do
      User.any_instance.stub(:save).and_return(false)
      post :create, {:user => { name: "only name" }}, valid_session
      assigns(:user).should be_a_new(User)
   end
 end
 

end

