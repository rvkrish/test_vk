require "rails_helper"

RSpec.describe TestmdlsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/testmdls").to route_to("testmdls#index")
    end

    it "routes to #new" do
      expect(:get => "/testmdls/new").to route_to("testmdls#new")
    end

    it "routes to #show" do
      expect(:get => "/testmdls/1").to route_to("testmdls#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/testmdls/1/edit").to route_to("testmdls#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/testmdls").to route_to("testmdls#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/testmdls/1").to route_to("testmdls#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/testmdls/1").to route_to("testmdls#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/testmdls/1").to route_to("testmdls#destroy", :id => "1")
    end

  end
end
