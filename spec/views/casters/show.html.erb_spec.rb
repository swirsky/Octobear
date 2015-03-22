require 'rails_helper'

RSpec.describe "casters/show", type: :view do
  before(:each) do
    @caster = assign(:caster, Caster.create!(
      :name => "Name",
      :user_id => 1,
      :wins => 2,
      :losses => 3,
      :ties => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
