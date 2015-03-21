require "rails_helper"

RSpec.describe RunningKeysController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/running_keys").to route_to("running_keys#index")
    end

    it "routes to #new" do
      expect(:get => "/running_keys/new").to route_to("running_keys#new")
    end

    it "routes to #show" do
      expect(:get => "/running_keys/1").to route_to("running_keys#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/running_keys/1/edit").to route_to("running_keys#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/running_keys").to route_to("running_keys#create")
    end

    it "routes to #update" do
      expect(:put => "/running_keys/1").to route_to("running_keys#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/running_keys/1").to route_to("running_keys#destroy", :id => "1")
    end

  end
end
