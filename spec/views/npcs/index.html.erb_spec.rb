require 'rails_helper'

RSpec.describe "npcs/index", type: :view do
  before(:each) do
    assign(:npcs, [
      Npc.create!(
        :name => "Name",
        :campaign_id => 1,
        :description => "Description",
        :race => "Race",
        :gender => "Gender",
        :location => "Location",
        :notes => "Notes",
        :influence => "Influence",
        :strength => "Strength"
      ),
      Npc.create!(
        :name => "Name",
        :campaign_id => 1,
        :description => "Description",
        :race => "Race",
        :gender => "Gender",
        :location => "Location",
        :notes => "Notes",
        :influence => "Influence",
        :strength => "Strength"
      )
    ])
  end

  it "renders a list of npcs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Race".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    assert_select "tr>td", :text => "Influence".to_s, :count => 2
    assert_select "tr>td", :text => "Strength".to_s, :count => 2
  end
end
