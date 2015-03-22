require 'rails_helper'

RSpec.describe "summonded_creatures/show", type: :view do
  before(:each) do
    @summonded_creature = assign(:summonded_creature, SummondedCreature.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/Weak Against/)
    expect(rendered).to match(/Resistant Against/)
  end
end
