require 'rails_helper'

RSpec.describe "running_keys/new", type: :view do
  before(:each) do
    assign(:running_key, RunningKey.new(
      :user_id => 1,
      :input => "MyString",
      :group_length => 1,
      :indicator_block => "MyString",
      :output => "MyString",
      :running_key => "MyString"
    ))
  end

  it "renders new running_key form" do
    render

    assert_select "form[action=?][method=?]", running_keys_path, "post" do

      assert_select "input#running_key_user_id[name=?]", "running_key[user_id]"

      assert_select "input#running_key_input[name=?]", "running_key[input]"

      assert_select "input#running_key_group_length[name=?]", "running_key[group_length]"

      assert_select "input#running_key_indicator_block[name=?]", "running_key[indicator_block]"

      assert_select "input#running_key_output[name=?]", "running_key[output]"

      assert_select "input#running_key_running_key[name=?]", "running_key[running_key]"
    end
  end
end
