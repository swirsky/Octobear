require 'rails_helper'

RSpec.describe "OneTimePads", type: :request do
  describe "GET /one_time_pads" do
    it "works! (now write some real specs)" do
      get one_time_pads_path
      expect(response).to have_http_status(200)
    end
  end
end
