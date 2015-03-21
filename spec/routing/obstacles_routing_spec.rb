require "rails_helper"

RSpec.describe ObstaclesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/obstacles").to route_to("obstacles#index")
    end

    it "routes to #new" do
      expect(:get => "/obstacles/new").to route_to("obstacles#new")
    end

    it "routes to #show" do
      expect(:get => "/obstacles/1").to route_to("obstacles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/obstacles/1/edit").to route_to("obstacles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/obstacles").to route_to("obstacles#create")
    end

    it "routes to #update" do
      expect(:put => "/obstacles/1").to route_to("obstacles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/obstacles/1").to route_to("obstacles#destroy", :id => "1")
    end

  end
end
