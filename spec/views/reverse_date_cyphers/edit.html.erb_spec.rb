require 'rails_helper'

RSpec.describe "reverse_date_cyphers/edit", type: :view do
  before(:each) do
    @reverse_date_cypher = assign(:reverse_date_cypher, ReverseDateCypher.create!(
      :input => "MyString",
      :date_cypher => 1,
      :output => "MyString"
    ))
  end

  it "renders the edit reverse_date_cypher form" do
    render

    assert_select "form[action=?][method=?]", reverse_date_cypher_path(@reverse_date_cypher), "post" do

      assert_select "input#reverse_date_cypher_input[name=?]", "reverse_date_cypher[input]"

      assert_select "input#reverse_date_cypher_date_cypher[name=?]", "reverse_date_cypher[date_cypher]"

      assert_select "input#reverse_date_cypher_output[name=?]", "reverse_date_cypher[output]"
    end
  end
end
