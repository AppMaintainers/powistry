require "spec_helper"

describe BookmarksController do
  describe "routing" do

    it "routes to #index" do
      get("/bookmarks").should route_to("bookmarks#index")
    end

    it "routes to #new" do
      get("/bookmarks/new").should route_to("bookmarks#new")
    end

    it "routes to #show" do
      get("/bookmarks/1").should route_to("bookmarks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bookmarks/1/edit").should route_to("bookmarks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bookmarks").should route_to("bookmarks#create")
    end

    it "routes to #update" do
      put("/bookmarks/1").should route_to("bookmarks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bookmarks/1").should route_to("bookmarks#destroy", :id => "1")
    end

  end
end
