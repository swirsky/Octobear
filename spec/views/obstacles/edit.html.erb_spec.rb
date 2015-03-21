require 'rails_helper'

RSpec.describe "obstacles/edit", type: :view do
  before(:each) do
    @obstacle = assign(:obstacle, Obstacle.create!(
      :skill => "MyString",
      :dc => 1,
      :description => "MyString",
      :chase_id => 1
    ))
  end

  it "renders the edit obstacle form" do
    render

    assert_select "form[action=?][method=?]", obstacle_path(@obstacle), "post" do

      assert_select "input#obstacle_skill[name=?]", "obstacle[skill]"

      assert_select "input#obstacle_dc[name=?]", "obstacle[dc]"

      assert_select "input#obstacle_description[name=?]", "obstacle[description]"

      assert_select "input#obstacle_chase_id[name=?]", "obstacle[chase_id]"
    end
  end
end
