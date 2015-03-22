require "rails_helper"

RSpec.describe SummonedCreaturesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/summoned_creatures").to route_to("summoned_creatures#index")
    end

    it "routes to #new" do
      expect(:get => "/summoned_creatures/new").to route_to("summoned_creatures#new")
    end

    it "routes to #show" do
      expect(:get => "/summoned_creatures/1").to route_to("summoned_creatures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/summoned_creatures/1/edit").to route_to("summoned_creatures#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/summoned_creatures").to route_to("summoned_creatures#create")
    end

    it "routes to #update" do
      expect(:put => "/summoned_creatures/1").to route_to("summoned_creatures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/summoned_creatures/1").to route_to("summoned_creatures#destroy", :id => "1")
    end

  end
end
