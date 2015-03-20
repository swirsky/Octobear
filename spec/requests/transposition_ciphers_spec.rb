require 'rails_helper'

RSpec.describe "TranspositionCiphers", type: :request do
  describe "GET /transposition_ciphers" do
    it "works! (now write some real specs)" do
      get transposition_ciphers_path
      expect(response).to have_http_status(200)
    end
  end
end
