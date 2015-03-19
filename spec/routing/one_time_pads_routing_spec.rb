require "rails_helper"

RSpec.describe OneTimePadsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/one_time_pads").to route_to("one_time_pads#index")
    end

    it "routes to #new" do
      expect(:get => "/one_time_pads/new").to route_to("one_time_pads#new")
    end

    it "routes to #show" do
      expect(:get => "/one_time_pads/1").to route_to("one_time_pads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/one_time_pads/1/edit").to route_to("one_time_pads#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/one_time_pads").to route_to("one_time_pads#create")
    end

    it "routes to #update" do
      expect(:put => "/one_time_pads/1").to route_to("one_time_pads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/one_time_pads/1").to route_to("one_time_pads#destroy", :id => "1")
    end

  end
end
