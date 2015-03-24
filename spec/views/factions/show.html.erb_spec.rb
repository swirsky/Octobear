require 'rails_helper'

RSpec.describe "factions/show", type: :view do
  before(:each) do
    @faction = assign(:faction, Faction.create!(
      :name => "Name",
      :campaign_id => 1,
      :leader_id => 2,
      :description => "Description",
      :type => "Type",
      :subtype => "Subtype",
      :headquarters => "Headquarters",
      :influence => "",
      :strength => "Strength",
      :secret => "Secret"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Subtype/)
    expect(rendered).to match(/Headquarters/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Strength/)
    expect(rendered).to match(/Secret/)
  end
end
