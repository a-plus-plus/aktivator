require "spec_helper"

describe AnswersController do
  describe "routing" do

    it "routes to #index" do
      get("/answers").should route_to("answers#index",:format =>:json)
    end

    it "routes to #new" do
      get("/answers/new").should route_to("answers#new",:format =>:json)
    end

    it "routes to #show" do
      get("/answers/1").should route_to("answers#show",:format =>:json, :id => "1")
    end

    it "routes to #edit" do
      get("/answers/1/edit").should route_to("answers#edit",:format =>:json, :id => "1")
    end

    it "routes to #create" do
      post("/answers").should route_to("answers#create",:format =>:json)
    end

    it "routes to #update" do
      put("/answers/1").should route_to("answers#update",:format =>:json, :id => "1")
    end

    it "routes to #destroy" do
      delete("/answers/1").should route_to("answers#destroy", :format =>:json,:id => "1")
    end

  end
end
