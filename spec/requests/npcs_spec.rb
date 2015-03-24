require 'rails_helper'

RSpec.describe "Npcs", type: :request do
  describe "GET /npcs" do
    it "works! (now write some real specs)" do
      get npcs_path
      expect(response).to have_http_status(200)
    end
  end
end
