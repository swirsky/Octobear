require "rails_helper"

RSpec.describe AllegiancesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/allegiances").to route_to("allegiances#index")
    end

    it "routes to #new" do
      expect(:get => "/allegiances/new").to route_to("allegiances#new")
    end

    it "routes to #show" do
      expect(:get => "/allegiances/1").to route_to("allegiances#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/allegiances/1/edit").to route_to("allegiances#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/allegiances").to route_to("allegiances#create")
    end

    it "routes to #update" do
      expect(:put => "/allegiances/1").to route_to("allegiances#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/allegiances/1").to route_to("allegiances#destroy", :id => "1")
    end

  end
end
