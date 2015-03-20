require "rails_helper"

RSpec.describe VSquareCyphersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v_square_cyphers").to route_to("v_square_cyphers#index")
    end

    it "routes to #new" do
      expect(:get => "/v_square_cyphers/new").to route_to("v_square_cyphers#new")
    end

    it "routes to #show" do
      expect(:get => "/v_square_cyphers/1").to route_to("v_square_cyphers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/v_square_cyphers/1/edit").to route_to("v_square_cyphers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/v_square_cyphers").to route_to("v_square_cyphers#create")
    end

    it "routes to #update" do
      expect(:put => "/v_square_cyphers/1").to route_to("v_square_cyphers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/v_square_cyphers/1").to route_to("v_square_cyphers#destroy", :id => "1")
    end

  end
end
