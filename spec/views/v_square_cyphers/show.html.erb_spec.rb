require 'rails_helper'

RSpec.describe "v_square_cyphers/show", type: :view do
  before(:each) do
    @v_square_cypher = assign(:v_square_cypher, VSquareCypher.create!(
      :input => "Input",
      :user_id => 1,
      :output => "Output",
      :codeword => "Codeword"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Input/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Output/)
    expect(rendered).to match(/Codeword/)
  end
end
