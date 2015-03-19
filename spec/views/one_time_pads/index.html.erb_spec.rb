require 'rails_helper'

RSpec.describe "one_time_pads/index", type: :view do
  before(:each) do
    assign(:one_time_pads, [
      OneTimePad.create!(
        :initial => "Initial",
        :cypher => "Cypher",
        :output => "Output",
        :line_length => 1,
        :group_length => 2,
        :number_of_keys => 3,
        :key_length => 4,
        :seed => ""
      ),
      OneTimePad.create!(
        :initial => "Initial",
        :cypher => "Cypher",
        :output => "Output",
        :line_length => 1,
        :group_length => 2,
        :number_of_keys => 3,
        :key_length => 4,
        :seed => ""
      )
    ])
  end

  it "renders a list of one_time_pads" do
    render
    assert_select "tr>td", :text => "Initial".to_s, :count => 2
    assert_select "tr>td", :text => "Cypher".to_s, :count => 2
    assert_select "tr>td", :text => "Output".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
