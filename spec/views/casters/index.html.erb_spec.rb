require 'rails_helper'

RSpec.describe "casters/index", type: :view do
  before(:each) do
    assign(:casters, [
      Caster.create!(
        :name => "Name",
        :user_id => 1,
        :wins => 2,
        :losses => 3,
        :ties => 4
      ),
      Caster.create!(
        :name => "Name",
        :user_id => 1,
        :wins => 2,
        :losses => 3,
        :ties => 4
      )
    ])
  end

  it "renders a list of casters" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
