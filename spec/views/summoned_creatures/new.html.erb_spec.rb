require 'rails_helper'

RSpec.describe "summoned_creatures/new", type: :view do
  before(:each) do
    assign(:summoned_creature, SummonedCreature.new(
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

  it "renders new summoned_creature form" do
    render

    assert_select "form[action=?][method=?]", summoned_creatures_path, "post" do

      assert_select "input#summoned_creature_name[name=?]", "summoned_creature[name]"

      assert_select "input#summoned_creature_caster_id[name=?]", "summoned_creature[caster_id]"

      assert_select "input#summoned_creature_type[name=?]", "summoned_creature[type]"

      assert_select "input#summoned_creature_hp[name=?]", "summoned_creature[hp]"

      assert_select "input#summoned_creature_str[name=?]", "summoned_creature[str]"

      assert_select "input#summoned_creature_dex[name=?]", "summoned_creature[dex]"

      assert_select "input#summoned_creature_con[name=?]", "summoned_creature[con]"

      assert_select "input#summoned_creature_intel[name=?]", "summoned_creature[intel]"

      assert_select "input#summoned_creature_wis[name=?]", "summoned_creature[wis]"

      assert_select "input#summoned_creature_cha[name=?]", "summoned_creature[cha]"

      assert_select "input#summoned_creature_weak_against[name=?]", "summoned_creature[weak_against]"

      assert_select "input#summoned_creature_resistant_against[name=?]", "summoned_creature[resistant_against]"
    end
  end
end
