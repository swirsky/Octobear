require 'rails_helper'

RSpec.describe "RotCyphers", type: :request do
  describe "GET /rot_cyphers" do
    it "works! (now write some real specs)" do
      get rot_cyphers_path
      expect(response).to have_http_status(200)
    end
  end
end
