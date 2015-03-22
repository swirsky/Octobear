require 'rails_helper'

RSpec.describe "attacks/index", type: :view do
  before(:each) do
    assign(:attacks, [
      Attack.create!(
        :name => "Name",
        :type => "Type",
        :damage => 1,
        :effect => "Effect",
        :critchance => 2,
        :tohit => 3
      ),
      Attack.create!(
        :name => "Name",
        :type => "Type",
        :damage => 1,
        :effect => "Effect",
        :critchance => 2,
        :tohit => 3
      )
    ])
  end

  it "renders a list of attacks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Effect".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
