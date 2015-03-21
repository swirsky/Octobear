require 'rails_helper'

RSpec.describe "chases/new", type: :view do
  before(:each) do
    assign(:chase, Chase.new(
      :name => "MyString",
      :cr => 1,
      :user_id => 1,
      :description => "MyString"
    ))
  end

  it "renders new chase form" do
    render

    assert_select "form[action=?][method=?]", chases_path, "post" do

      assert_select "input#chase_name[name=?]", "chase[name]"

      assert_select "input#chase_cr[name=?]", "chase[cr]"

      assert_select "input#chase_user_id[name=?]", "chase[user_id]"

      assert_select "input#chase_description[name=?]", "chase[description]"
    end
  end
end
