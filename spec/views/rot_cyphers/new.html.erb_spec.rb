require 'rails_helper'

RSpec.describe "rot_cyphers/new", type: :view do
  before(:each) do
    assign(:rot_cypher, RotCypher.new(
      :input => "MyString",
      :user_id => 1,
      :rot => 1,
      :output => "MyString"
    ))
  end

  it "renders new rot_cypher form" do
    render

    assert_select "form[action=?][method=?]", rot_cyphers_path, "post" do

      assert_select "input#rot_cypher_input[name=?]", "rot_cypher[input]"

      assert_select "input#rot_cypher_user_id[name=?]", "rot_cypher[user_id]"

      assert_select "input#rot_cypher_rot[name=?]", "rot_cypher[rot]"

      assert_select "input#rot_cypher_output[name=?]", "rot_cypher[output]"
    end
  end
end
