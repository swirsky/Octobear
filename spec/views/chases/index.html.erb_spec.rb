require 'rails_helper'

RSpec.describe "chases/index", type: :view do
  before(:each) do
    assign(:chases, [
      Chase.create!(
        :name => "Name",
        :cr => 1,
        :user_id => 2,
        :description => "Description"
      ),
      Chase.create!(
        :name => "Name",
        :cr => 1,
        :user_id => 2,
        :description => "Description"
      )
    ])
  end

  it "renders a list of chases" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
