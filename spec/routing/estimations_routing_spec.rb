require "spec_helper"

describe EstimationsController do
  describe "routing" do

    it "routes to #index" do
      get("/estimations").should route_to("estimations#index")
    end

    it "routes to #new" do
      get("/estimations/new").should route_to("estimations#new")
    end

    it "routes to #show" do
      get("/estimations/1").should route_to("estimations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/estimations/1/edit").should route_to("estimations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/estimations").should route_to("estimations#create")
    end

    it "routes to #update" do
      put("/estimations/1").should route_to("estimations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/estimations/1").should route_to("estimations#destroy", :id => "1")
    end

  end
end
