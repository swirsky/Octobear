require 'rails_helper'

RSpec.describe "chases/show", type: :view do
  before(:each) do
    @chase = assign(:chase, Chase.create!(
      :name => "Name",
      :cr => 1,
      :user_id => 2,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Description/)
  end
end
