require 'rails_helper'

RSpec.describe "attacks/new", type: :view do
  before(:each) do
    assign(:attack, Attack.new(
      :name => "MyString",
      :type => "",
      :damage => 1,
      :effect => "MyString",
      :critchance => 1,
      :tohit => 1
    ))
  end

  it "renders new attack form" do
    render

    assert_select "form[action=?][method=?]", attacks_path, "post" do

      assert_select "input#attack_name[name=?]", "attack[name]"

      assert_select "input#attack_type[name=?]", "attack[type]"

      assert_select "input#attack_damage[name=?]", "attack[damage]"

      assert_select "input#attack_effect[name=?]", "attack[effect]"

      assert_select "input#attack_critchance[name=?]", "attack[critchance]"

      assert_select "input#attack_tohit[name=?]", "attack[tohit]"
    end
  end
end
