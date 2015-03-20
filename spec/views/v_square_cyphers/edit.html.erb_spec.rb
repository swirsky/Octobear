require 'rails_helper'

RSpec.describe "v_square_cyphers/edit", type: :view do
  before(:each) do
    @v_square_cypher = assign(:v_square_cypher, VSquareCypher.create!(
      :input => "MyString",
      :user_id => 1,
      :output => "MyString",
      :codeword => "MyString"
    ))
  end

  it "renders the edit v_square_cypher form" do
    render

    assert_select "form[action=?][method=?]", v_square_cypher_path(@v_square_cypher), "post" do

      assert_select "input#v_square_cypher_input[name=?]", "v_square_cypher[input]"

      assert_select "input#v_square_cypher_user_id[name=?]", "v_square_cypher[user_id]"

      assert_select "input#v_square_cypher_output[name=?]", "v_square_cypher[output]"

      assert_select "input#v_square_cypher_codeword[name=?]", "v_square_cypher[codeword]"
    end
  end
end
