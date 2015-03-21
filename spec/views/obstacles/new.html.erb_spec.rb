require 'rails_helper'

RSpec.describe "obstacles/new", type: :view do
  before(:each) do
    assign(:obstacle, Obstacle.new(
      :skill => "MyString",
      :dc => 1,
      :description => "MyString",
      :chase_id => 1
    ))
  end

  it "renders new obstacle form" do
    render

    assert_select "form[action=?][method=?]", obstacles_path, "post" do

      assert_select "input#obstacle_skill[name=?]", "obstacle[skill]"

      assert_select "input#obstacle_dc[name=?]", "obstacle[dc]"

      assert_select "input#obstacle_description[name=?]", "obstacle[description]"

      assert_select "input#obstacle_chase_id[name=?]", "obstacle[chase_id]"
    end
  end
end
