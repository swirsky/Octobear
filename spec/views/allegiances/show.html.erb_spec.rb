require 'rails_helper'

RSpec.describe "allegiances/show", type: :view do
  before(:each) do
    @allegiance = assign(:allegiance, Allegiance.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
