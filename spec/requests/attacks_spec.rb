require 'rails_helper'

RSpec.describe "Attacks", type: :request do
  describe "GET /attacks" do
    it "works! (now write some real specs)" do
      get attacks_path
      expect(response).to have_http_status(200)
    end
  end
end
