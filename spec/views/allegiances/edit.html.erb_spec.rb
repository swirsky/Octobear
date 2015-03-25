require 'rails_helper'

RSpec.describe "allegiances/edit", type: :view do
  before(:each) do
    @allegiance = assign(:allegiance, Allegiance.create!())
  end

  it "renders the edit allegiance form" do
    render

    assert_select "form[action=?][method=?]", allegiance_path(@allegiance), "post" do
    end
  end
end
