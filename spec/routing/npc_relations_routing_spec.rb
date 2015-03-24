require "rails_helper"

RSpec.describe NpcRelationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/npc_relations").to route_to("npc_relations#index")
    end

    it "routes to #new" do
      expect(:get => "/npc_relations/new").to route_to("npc_relations#new")
    end

    it "routes to #show" do
      expect(:get => "/npc_relations/1").to route_to("npc_relations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/npc_relations/1/edit").to route_to("npc_relations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/npc_relations").to route_to("npc_relations#create")
    end

    it "routes to #update" do
      expect(:put => "/npc_relations/1").to route_to("npc_relations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/npc_relations/1").to route_to("npc_relations#destroy", :id => "1")
    end

  end
end
