require "spec_helper"

describe SurveysController do
  describe "routing" do

    it "routes to #index" do
      get("/surveys").should route_to("surveys#index", :format =>:json)
    end

    it "routes to #new" do
      get("/surveys/new").should route_to("surveys#new", :format =>:json)
    end

    it "routes to #show" do
      get("/surveys/1").should route_to("surveys#show", :format =>:json, :id => "1")
    end

    it "routes to #edit" do
      get("/surveys/1/edit").should route_to("surveys#edit", :format =>:json, :id => "1")
    end

    it "routes to #create" do
      post("/surveys").should route_to("surveys#create", :format =>:json)
    end

    it "routes to #update" do
      put("/surveys/1").should route_to("surveys#update", :format =>:json, :id => "1")
    end

    it "routes to #destroy" do
      delete("/surveys/1").should route_to("surveys#destroy", :format =>:json, :id => "1")
    end

  end
end
