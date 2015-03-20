require 'rails_helper'

RSpec.describe "reverse_date_cyphers/show", type: :view do
  before(:each) do
    @reverse_date_cypher = assign(:reverse_date_cypher, ReverseDateCypher.create!(
      :input => "Input",
      :date_cypher => 1,
      :output => "Output"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Input/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Output/)
  end
end
