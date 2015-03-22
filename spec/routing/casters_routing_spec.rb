require "rails_helper"

RSpec.describe CastersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/casters").to route_to("casters#index")
    end

    it "routes to #new" do
      expect(:get => "/casters/new").to route_to("casters#new")
    end

    it "routes to #show" do
      expect(:get => "/casters/1").to route_to("casters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/casters/1/edit").to route_to("casters#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/casters").to route_to("casters#create")
    end

    it "routes to #update" do
      expect(:put => "/casters/1").to route_to("casters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/casters/1").to route_to("casters#destroy", :id => "1")
    end

  end
end
