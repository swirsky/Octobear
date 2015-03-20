require 'rails_helper'

RSpec.describe "reverse_date_cyphers/index", type: :view do
  before(:each) do
    assign(:reverse_date_cyphers, [
      ReverseDateCypher.create!(
        :input => "Input",
        :date_cypher => 1,
        :output => "Output"
      ),
      ReverseDateCypher.create!(
        :input => "Input",
        :date_cypher => 1,
        :output => "Output"
      )
    ])
  end

  it "renders a list of reverse_date_cyphers" do
    render
    assert_select "tr>td", :text => "Input".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Output".to_s, :count => 2
  end
end
