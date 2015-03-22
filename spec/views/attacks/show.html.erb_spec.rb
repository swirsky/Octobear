require 'rails_helper'

RSpec.describe "attacks/show", type: :view do
  before(:each) do
    @attack = assign(:attack, Attack.create!(
      :name => "Name",
      :type => "Type",
      :damage => 1,
      :effect => "Effect",
      :critchance => 2,
      :tohit => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Effect/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
