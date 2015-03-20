require 'rails_helper'

RSpec.describe "transposition_ciphers/new", type: :view do
  before(:each) do
    assign(:transposition_cipher, TranspositionCipher.new(
      :input => "MyString",
      :user_id => 1,
      :keyword => "MyString",
      :output => "MyString"
    ))
  end

  it "renders new transposition_cipher form" do
    render

    assert_select "form[action=?][method=?]", transposition_ciphers_path, "post" do

      assert_select "input#transposition_cipher_input[name=?]", "transposition_cipher[input]"

      assert_select "input#transposition_cipher_user_id[name=?]", "transposition_cipher[user_id]"

      assert_select "input#transposition_cipher_keyword[name=?]", "transposition_cipher[keyword]"

      assert_select "input#transposition_cipher_output[name=?]", "transposition_cipher[output]"
    end
  end
end
