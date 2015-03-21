require 'rails_helper'

RSpec.describe "Obstacles", type: :request do
  describe "GET /obstacles" do
    it "works! (now write some real specs)" do
      get obstacles_path
      expect(response).to have_http_status(200)
    end
  end
end
