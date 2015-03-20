require "rails_helper"

RSpec.describe ReverseDateCyphersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/reverse_date_cyphers").to route_to("reverse_date_cyphers#index")
    end

    it "routes to #new" do
      expect(:get => "/reverse_date_cyphers/new").to route_to("reverse_date_cyphers#new")
    end

    it "routes to #show" do
      expect(:get => "/reverse_date_cyphers/1").to route_to("reverse_date_cyphers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/reverse_date_cyphers/1/edit").to route_to("reverse_date_cyphers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/reverse_date_cyphers").to route_to("reverse_date_cyphers#create")
    end

    it "routes to #update" do
      expect(:put => "/reverse_date_cyphers/1").to route_to("reverse_date_cyphers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/reverse_date_cyphers/1").to route_to("reverse_date_cyphers#destroy", :id => "1")
    end

  end
end
