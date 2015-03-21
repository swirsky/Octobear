require 'rails_helper'

RSpec.describe "obstacles/show", type: :view do
  before(:each) do
    @obstacle = assign(:obstacle, Obstacle.create!(
      :skill => "Skill",
      :dc => 1,
      :description => "Description",
      :chase_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Skill/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
  end
end
