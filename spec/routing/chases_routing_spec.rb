require "rails_helper"

RSpec.describe ChasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/chases").to route_to("chases#index")
    end

    it "routes to #new" do
      expect(:get => "/chases/new").to route_to("chases#new")
    end

    it "routes to #show" do
      expect(:get => "/chases/1").to route_to("chases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/chases/1/edit").to route_to("chases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/chases").to route_to("chases#create")
    end

    it "routes to #update" do
      expect(:put => "/chases/1").to route_to("chases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/chases/1").to route_to("chases#destroy", :id => "1")
    end

  end
end
