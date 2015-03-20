require "rails_helper"

RSpec.describe TranspositionCiphersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/transposition_ciphers").to route_to("transposition_ciphers#index")
    end

    it "routes to #new" do
      expect(:get => "/transposition_ciphers/new").to route_to("transposition_ciphers#new")
    end

    it "routes to #show" do
      expect(:get => "/transposition_ciphers/1").to route_to("transposition_ciphers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/transposition_ciphers/1/edit").to route_to("transposition_ciphers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/transposition_ciphers").to route_to("transposition_ciphers#create")
    end

    it "routes to #update" do
      expect(:put => "/transposition_ciphers/1").to route_to("transposition_ciphers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/transposition_ciphers/1").to route_to("transposition_ciphers#destroy", :id => "1")
    end

  end
end
