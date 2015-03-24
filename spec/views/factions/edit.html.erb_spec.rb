require 'rails_helper'

RSpec.describe "factions/edit", type: :view do
  before(:each) do
    @faction = assign(:faction, Faction.create!(
      :name => "MyString",
      :campaign_id => 1,
      :leader_id => 1,
      :description => "MyString",
      :type => "",
      :subtype => "MyString",
      :headquarters => "MyString",
      :influence => "",
      :strength => "MyString",
      :secret => "MyString"
    ))
  end

  it "renders the edit faction form" do
    render

    assert_select "form[action=?][method=?]", faction_path(@faction), "post" do

      assert_select "input#faction_name[name=?]", "faction[name]"

      assert_select "input#faction_campaign_id[name=?]", "faction[campaign_id]"

      assert_select "input#faction_leader_id[name=?]", "faction[leader_id]"

      assert_select "input#faction_description[name=?]", "faction[description]"

      assert_select "input#faction_type[name=?]", "faction[type]"

      assert_select "input#faction_subtype[name=?]", "faction[subtype]"

      assert_select "input#faction_headquarters[name=?]", "faction[headquarters]"

      assert_select "input#faction_influence[name=?]", "faction[influence]"

      assert_select "input#faction_strength[name=?]", "faction[strength]"

      assert_select "input#faction_secret[name=?]", "faction[secret]"
    end
  end
end
