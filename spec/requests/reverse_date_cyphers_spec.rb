require 'rails_helper'

RSpec.describe "ReverseDateCyphers", type: :request do
  describe "GET /reverse_date_cyphers" do
    it "works! (now write some real specs)" do
      get reverse_date_cyphers_path
      expect(response).to have_http_status(200)
    end
  end
end
