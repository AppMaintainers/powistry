require "spec_helper"

describe ComplexitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/complexities").should route_to("complexities#index")
    end

    it "routes to #new" do
      get("/complexities/new").should route_to("complexities#new")
    end

    it "routes to #show" do
      get("/complexities/1").should route_to("complexities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/complexities/1/edit").should route_to("complexities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/complexities").should route_to("complexities#create")
    end

    it "routes to #update" do
      put("/complexities/1").should route_to("complexities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/complexities/1").should route_to("complexities#destroy", :id => "1")
    end

  end
end
