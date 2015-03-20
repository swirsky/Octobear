require 'rails_helper'

RSpec.describe "VSquareCyphers", type: :request do
  describe "GET /v_square_cyphers" do
    it "works! (now write some real specs)" do
      get v_square_cyphers_path
      expect(response).to have_http_status(200)
    end
  end
end
