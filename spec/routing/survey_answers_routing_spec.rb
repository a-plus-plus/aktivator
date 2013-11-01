require "spec_helper"

describe SurveyAnswersController do
  describe "routing" do

    it "routes to #index" do
      get("/survey_answers").should route_to("survey_answers#index")
    end

    it "routes to #new" do
      get("/survey_answers/new").should route_to("survey_answers#new")
    end

    it "routes to #show" do
      get("/survey_answers/1").should route_to("survey_answers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/survey_answers/1/edit").should route_to("survey_answers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/survey_answers").should route_to("survey_answers#create")
    end

    it "routes to #update" do
      put("/survey_answers/1").should route_to("survey_answers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/survey_answers/1").should route_to("survey_answers#destroy", :id => "1")
    end

  end
end
