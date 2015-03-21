require 'rails_helper'

RSpec.describe "running_keys/show", type: :view do
  before(:each) do
    @running_key = assign(:running_key, RunningKey.create!(
      :user_id => 1,
      :input => "Input",
      :group_length => 2,
      :indicator_block => "Indicator Block",
      :output => "Output",
      :running_key => "Running Key"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Input/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Indicator Block/)
    expect(rendered).to match(/Output/)
    expect(rendered).to match(/Running Key/)
  end
end
