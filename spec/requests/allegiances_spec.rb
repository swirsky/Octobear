require 'rails_helper'

RSpec.describe "Allegiances", type: :request do
  describe "GET /allegiances" do
    it "works! (now write some real specs)" do
      get allegiances_path
      expect(response).to have_http_status(200)
    end
  end
end
