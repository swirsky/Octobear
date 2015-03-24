require 'rails_helper'

RSpec.describe "factions/index", type: :view do
  before(:each) do
    assign(:factions, [
      Faction.create!(
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
      ),
      Faction.create!(
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
      )
    ])
  end

  it "renders a list of factions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Subtype".to_s, :count => 2
    assert_select "tr>td", :text => "Headquarters".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Strength".to_s, :count => 2
    assert_select "tr>td", :text => "Secret".to_s, :count => 2
  end
end
