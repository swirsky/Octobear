require 'rails_helper'

RSpec.describe "chases/edit", type: :view do
  before(:each) do
    @chase = assign(:chase, Chase.create!(
      :name => "MyString",
      :cr => 1,
      :user_id => 1,
      :description => "MyString"
    ))
  end

  it "renders the edit chase form" do
    render

    assert_select "form[action=?][method=?]", chase_path(@chase), "post" do

      assert_select "input#chase_name[name=?]", "chase[name]"

      assert_select "input#chase_cr[name=?]", "chase[cr]"

      assert_select "input#chase_user_id[name=?]", "chase[user_id]"

      assert_select "input#chase_description[name=?]", "chase[description]"
    end
  end
end
