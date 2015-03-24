require 'rails_helper'

RSpec.describe "npc_relations/index", type: :view do
  before(:each) do
    assign(:npc_relations, [
      NpcRelation.create!(
        :campaign_id => 1,
        :npc1_id => 2,
        :npc2_id => 3,
        :status => "Status",
        :notes => "Notes"
      ),
      NpcRelation.create!(
        :campaign_id => 1,
        :npc1_id => 2,
        :npc2_id => 3,
        :status => "Status",
        :notes => "Notes"
      )
    ])
  end

  it "renders a list of npc_relations" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
  end
end
