require 'rails_helper'

RSpec.describe "npcs/edit", type: :view do
  before(:each) do
    @npc = assign(:npc, Npc.create!(
      :name => "MyString",
      :campaign_id => 1,
      :description => "MyString",
      :race => "MyString",
      :gender => "MyString",
      :location => "MyString",
      :notes => "MyString",
      :influence => "MyString",
      :strength => "MyString"
    ))
  end

  it "renders the edit npc form" do
    render

    assert_select "form[action=?][method=?]", npc_path(@npc), "post" do

      assert_select "input#npc_name[name=?]", "npc[name]"

      assert_select "input#npc_campaign_id[name=?]", "npc[campaign_id]"

      assert_select "input#npc_description[name=?]", "npc[description]"

      assert_select "input#npc_race[name=?]", "npc[race]"

      assert_select "input#npc_gender[name=?]", "npc[gender]"

      assert_select "input#npc_location[name=?]", "npc[location]"

      assert_select "input#npc_notes[name=?]", "npc[notes]"

      assert_select "input#npc_influence[name=?]", "npc[influence]"

      assert_select "input#npc_strength[name=?]", "npc[strength]"
    end
  end
end
