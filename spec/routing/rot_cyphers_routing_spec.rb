require "rails_helper"

RSpec.describe RotCyphersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rot_cyphers").to route_to("rot_cyphers#index")
    end

    it "routes to #new" do
      expect(:get => "/rot_cyphers/new").to route_to("rot_cyphers#new")
    end

    it "routes to #show" do
      expect(:get => "/rot_cyphers/1").to route_to("rot_cyphers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rot_cyphers/1/edit").to route_to("rot_cyphers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rot_cyphers").to route_to("rot_cyphers#create")
    end

    it "routes to #update" do
      expect(:put => "/rot_cyphers/1").to route_to("rot_cyphers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rot_cyphers/1").to route_to("rot_cyphers#destroy", :id => "1")
    end

  end
end
