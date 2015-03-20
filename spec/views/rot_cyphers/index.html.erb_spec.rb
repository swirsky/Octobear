require 'rails_helper'

RSpec.describe "rot_cyphers/index", type: :view do
  before(:each) do
    assign(:rot_cyphers, [
      RotCypher.create!(
        :input => "Input",
        :user_id => 1,
        :rot => 2,
        :output => "Output"
      ),
      RotCypher.create!(
        :input => "Input",
        :user_id => 1,
        :rot => 2,
        :output => "Output"
      )
    ])
  end

  it "renders a list of rot_cyphers" do
    render
    assert_select "tr>td", :text => "Input".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Output".to_s, :count => 2
  end
end
