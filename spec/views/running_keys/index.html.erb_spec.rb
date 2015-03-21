require 'rails_helper'

RSpec.describe "running_keys/index", type: :view do
  before(:each) do
    assign(:running_keys, [
      RunningKey.create!(
        :user_id => 1,
        :input => "Input",
        :group_length => 2,
        :indicator_block => "Indicator Block",
        :output => "Output",
        :running_key => "Running Key"
      ),
      RunningKey.create!(
        :user_id => 1,
        :input => "Input",
        :group_length => 2,
        :indicator_block => "Indicator Block",
        :output => "Output",
        :running_key => "Running Key"
      )
    ])
  end

  it "renders a list of running_keys" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Input".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Indicator Block".to_s, :count => 2
    assert_select "tr>td", :text => "Output".to_s, :count => 2
    assert_select "tr>td", :text => "Running Key".to_s, :count => 2
  end
end
