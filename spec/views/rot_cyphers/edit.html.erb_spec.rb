require 'rails_helper'

RSpec.describe "rot_cyphers/edit", type: :view do
  before(:each) do
    @rot_cypher = assign(:rot_cypher, RotCypher.create!(
      :input => "MyString",
      :user_id => 1,
      :rot => 1,
      :output => "MyString"
    ))
  end

  it "renders the edit rot_cypher form" do
    render

    assert_select "form[action=?][method=?]", rot_cypher_path(@rot_cypher), "post" do

      assert_select "input#rot_cypher_input[name=?]", "rot_cypher[input]"

      assert_select "input#rot_cypher_user_id[name=?]", "rot_cypher[user_id]"

      assert_select "input#rot_cypher_rot[name=?]", "rot_cypher[rot]"

      assert_select "input#rot_cypher_output[name=?]", "rot_cypher[output]"
    end
  end
end
