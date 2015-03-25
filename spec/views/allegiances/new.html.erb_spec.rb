require 'rails_helper'

RSpec.describe "allegiances/new", type: :view do
  before(:each) do
    assign(:allegiance, Allegiance.new())
  end

  it "renders new allegiance form" do
    render

    assert_select "form[action=?][method=?]", allegiances_path, "post" do
    end
  end
end
