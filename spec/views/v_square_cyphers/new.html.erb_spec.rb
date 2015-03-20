require 'rails_helper'

RSpec.describe "v_square_cyphers/new", type: :view do
  before(:each) do
    assign(:v_square_cypher, VSquareCypher.new(
      :input => "MyString",
      :user_id => 1,
      :output => "MyString",
      :codeword => "MyString"
    ))
  end

  it "renders new v_square_cypher form" do
    render

    assert_select "form[action=?][method=?]", v_square_cyphers_path, "post" do

      assert_select "input#v_square_cypher_input[name=?]", "v_square_cypher[input]"

      assert_select "input#v_square_cypher_user_id[name=?]", "v_square_cypher[user_id]"

      assert_select "input#v_square_cypher_output[name=?]", "v_square_cypher[output]"

      assert_select "input#v_square_cypher_codeword[name=?]", "v_square_cypher[codeword]"
    end
  end
end
