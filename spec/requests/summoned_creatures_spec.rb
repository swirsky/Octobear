require 'rails_helper'

RSpec.describe "SummonedCreatures", type: :request do
  describe "GET /summoned_creatures" do
    it "works! (now write some real specs)" do
      get summoned_creatures_path
      expect(response).to have_http_status(200)
    end
  end
end
