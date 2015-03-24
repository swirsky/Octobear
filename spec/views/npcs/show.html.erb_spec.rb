require 'rails_helper'

RSpec.describe "npcs/show", type: :view do
  before(:each) do
    @npc = assign(:npc, Npc.create!(
      :name => "Name",
      :campaign_id => 1,
      :description => "Description",
      :race => "Race",
      :gender => "Gender",
      :location => "Location",
      :notes => "Notes",
      :influence => "Influence",
      :strength => "Strength"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Race/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Notes/)
    expect(rendered).to match(/Influence/)
    expect(rendered).to match(/Strength/)
  end
end
