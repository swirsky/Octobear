require 'rails_helper'

RSpec.describe "allegiances/index", type: :view do
  before(:each) do
    assign(:allegiances, [
      Allegiance.create!(),
      Allegiance.create!()
    ])
  end

  it "renders a list of allegiances" do
    render
  end
end
