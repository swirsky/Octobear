require 'rails_helper'

RSpec.describe "one_time_pads/show", type: :view do
  before(:each) do
    @one_time_pad = assign(:one_time_pad, OneTimePad.create!(
      :initial => "Initial",
      :cypher => "Cypher",
      :output => "Output",
      :line_length => 1,
      :group_length => 2,
      :number_of_keys => 3,
      :key_length => 4,
      :seed => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Initial/)
    expect(rendered).to match(/Cypher/)
    expect(rendered).to match(/Output/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(//)
  end
end
