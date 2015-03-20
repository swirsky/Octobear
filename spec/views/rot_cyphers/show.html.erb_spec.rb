require 'rails_helper'

RSpec.describe "rot_cyphers/show", type: :view do
  before(:each) do
    @rot_cypher = assign(:rot_cypher, RotCypher.create!(
      :input => "Input",
      :user_id => 1,
      :rot => 2,
      :output => "Output"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Input/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Output/)
  end
end
