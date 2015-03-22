require 'rails_helper'

RSpec.describe "casters/edit", type: :view do
  before(:each) do
    @caster = assign(:caster, Caster.create!(
      :name => "MyString",
      :user_id => 1,
      :wins => 1,
      :losses => 1,
      :ties => 1
    ))
  end

  it "renders the edit caster form" do
    render

    assert_select "form[action=?][method=?]", caster_path(@caster), "post" do

      assert_select "input#caster_name[name=?]", "caster[name]"

      assert_select "input#caster_user_id[name=?]", "caster[user_id]"

      assert_select "input#caster_wins[name=?]", "caster[wins]"

      assert_select "input#caster_losses[name=?]", "caster[losses]"

      assert_select "input#caster_ties[name=?]", "caster[ties]"
    end
  end
end
