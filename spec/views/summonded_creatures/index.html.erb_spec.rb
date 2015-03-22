require 'rails_helper'

RSpec.describe "summonded_creatures/index", type: :view do
  before(:each) do
    assign(:summonded_creatures, [
      SummondedCreature.create!(
        :name => "Name",
        :caster_id => 1,
        :type => "Type",
        :hp => 2,
        :str => 3,
        :dex => 4,
        :con => 5,
        :intel => 6,
        :wis => 7,
        :cha => 8,
        :weak_against => "Weak Against",
        :resistant_against => "Resistant Against"
      ),
      SummondedCreature.create!(
        :name => "Name",
        :caster_id => 1,
        :type => "Type",
        :hp => 2,
        :str => 3,
        :dex => 4,
        :con => 5,
        :intel => 6,
        :wis => 7,
        :cha => 8,
        :weak_against => "Weak Against",
        :resistant_against => "Resistant Against"
      )
    ])
  end

  it "renders a list of summonded_creatures" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => "Weak Against".to_s, :count => 2
    assert_select "tr>td", :text => "Resistant Against".to_s, :count => 2
  end
end
