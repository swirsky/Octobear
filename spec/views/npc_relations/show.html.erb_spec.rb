require 'rails_helper'

RSpec.describe "npc_relations/show", type: :view do
  before(:each) do
    @npc_relation = assign(:npc_relation, NpcRelation.create!(
      :campaign_id => 1,
      :npc1_id => 2,
      :npc2_id => 3,
      :status => "Status",
      :notes => "Notes"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Notes/)
  end
end
