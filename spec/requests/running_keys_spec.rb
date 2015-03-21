require 'rails_helper'

RSpec.describe "RunningKeys", type: :request do
  describe "GET /running_keys" do
    it "works! (now write some real specs)" do
      get running_keys_path
      expect(response).to have_http_status(200)
    end
  end
end
