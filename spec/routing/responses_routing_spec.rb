require "spec_helper"

describe ResponsesController do
  describe "routing" do

    it "routes to #index" do
      get("/responses").should route_to("responses#index",:format =>:json)
    end

    it "routes to #new" do
      get("/responses/new").should route_to("responses#new",:format =>:json)
    end

    it "routes to #show" do
      get("/responses/1").should route_to("responses#show", :format =>:json,:id => "1")
    end

    it "routes to #edit" do
      get("/responses/1/edit").should route_to("responses#edit", :format =>:json,:id => "1")
    end

    it "routes to #create" do
      post("/responses").should route_to("responses#create", :format =>:json)
    end

    it "routes to #update" do
      put("/responses/1").should route_to("responses#update",:format =>:json, :id => "1")
    end

    it "routes to #destroy" do
      delete("/responses/1").should route_to("responses#destroy", :format =>:json, :id => "1")
    end

  end
end
