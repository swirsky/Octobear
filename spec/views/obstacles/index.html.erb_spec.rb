require 'rails_helper'

RSpec.describe "obstacles/index", type: :view do
  before(:each) do
    assign(:obstacles, [
      Obstacle.create!(
        :skill => "Skill",
        :dc => 1,
        :description => "Description",
        :chase_id => 2
      ),
      Obstacle.create!(
        :skill => "Skill",
        :dc => 1,
        :description => "Description",
        :chase_id => 2
      )
    ])
  end

  it "renders a list of obstacles" do
    render
    assert_select "tr>td", :text => "Skill".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
