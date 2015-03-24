require 'rails_helper'

RSpec.describe "npc_relations/new", type: :view do
  before(:each) do
    assign(:npc_relation, NpcRelation.new(
      :campaign_id => 1,
      :npc1_id => 1,
      :npc2_id => 1,
      :status => "MyString",
      :notes => "MyString"
    ))
  end

  it "renders new npc_relation form" do
    render

    assert_select "form[action=?][method=?]", npc_relations_path, "post" do

      assert_select "input#npc_relation_campaign_id[name=?]", "npc_relation[campaign_id]"

      assert_select "input#npc_relation_npc1_id[name=?]", "npc_relation[npc1_id]"

      assert_select "input#npc_relation_npc2_id[name=?]", "npc_relation[npc2_id]"

      assert_select "input#npc_relation_status[name=?]", "npc_relation[status]"

      assert_select "input#npc_relation_notes[name=?]", "npc_relation[notes]"
    end
  end
end
