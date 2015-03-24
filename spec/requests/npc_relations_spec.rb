require 'rails_helper'

RSpec.describe "NpcRelations", type: :request do
  describe "GET /npc_relations" do
    it "works! (now write some real specs)" do
      get npc_relations_path
      expect(response).to have_http_status(200)
    end
  end
end
