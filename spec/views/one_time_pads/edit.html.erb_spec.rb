require 'rails_helper'

RSpec.describe "one_time_pads/edit", type: :view do
  before(:each) do
    @one_time_pad = assign(:one_time_pad, OneTimePad.create!(
      :initial => "MyString",
      :cypher => "MyString",
      :output => "MyString",
      :line_length => 1,
      :group_length => 1,
      :number_of_keys => 1,
      :key_length => 1,
      :seed => ""
    ))
  end

  it "renders the edit one_time_pad form" do
    render

    assert_select "form[action=?][method=?]", one_time_pad_path(@one_time_pad), "post" do

      assert_select "input#one_time_pad_initial[name=?]", "one_time_pad[initial]"

      assert_select "input#one_time_pad_cypher[name=?]", "one_time_pad[cypher]"

      assert_select "input#one_time_pad_output[name=?]", "one_time_pad[output]"

      assert_select "input#one_time_pad_line_length[name=?]", "one_time_pad[line_length]"

      assert_select "input#one_time_pad_group_length[name=?]", "one_time_pad[group_length]"

      assert_select "input#one_time_pad_number_of_keys[name=?]", "one_time_pad[number_of_keys]"

      assert_select "input#one_time_pad_key_length[name=?]", "one_time_pad[key_length]"

      assert_select "input#one_time_pad_seed[name=?]", "one_time_pad[seed]"
    end
  end
end
