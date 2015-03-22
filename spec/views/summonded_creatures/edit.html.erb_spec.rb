require 'rails_helper'

RSpec.describe "summonded_creatures/edit", type: :view do
  before(:each) do
    @summonded_creature = assign(:summonded_creature, SummondedCreature.create!(
      :name => "MyString",
      :caster_id => 1,
      :type => "",
      :hp => 1,
      :str => 1,
      :dex => 1,
      :con => 1,
      :intel => 1,
      :wis => 1,
      :cha => 1,
      :weak_against => "MyString",
      :resistant_against => "MyString"
    ))
  end

  it "renders the edit summonded_creature form" do
    render

    assert_select "form[action=?][method=?]", summonded_creature_path(@summonded_creature), "post" do

      assert_select "input#summonded_creature_name[name=?]", "summonded_creature[name]"

      assert_select "input#summonded_creature_caster_id[name=?]", "summonded_creature[caster_id]"

      assert_select "input#summonded_creature_type[name=?]", "summonded_creature[type]"

      assert_select "input#summonded_creature_hp[name=?]", "summonded_creature[hp]"

      assert_select "input#summonded_creature_str[name=?]", "summonded_creature[str]"

      assert_select "input#summonded_creature_dex[name=?]", "summonded_creature[dex]"

      assert_select "input#summonded_creature_con[name=?]", "summonded_creature[con]"

      assert_select "input#summonded_creature_intel[name=?]", "summonded_creature[intel]"

      assert_select "input#summonded_creature_wis[name=?]", "summonded_creature[wis]"

      assert_select "input#summonded_creature_cha[name=?]", "summonded_creature[cha]"

      assert_select "input#summonded_creature_weak_against[name=?]", "summonded_creature[weak_against]"

      assert_select "input#summonded_creature_resistant_against[name=?]", "summonded_creature[resistant_against]"
    end
  end
end
