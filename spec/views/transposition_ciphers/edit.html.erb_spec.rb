require 'rails_helper'

RSpec.describe "transposition_ciphers/edit", type: :view do
  before(:each) do
    @transposition_cipher = assign(:transposition_cipher, TranspositionCipher.create!(
      :input => "MyString",
      :user_id => 1,
      :keyword => "MyString",
      :output => "MyString"
    ))
  end

  it "renders the edit transposition_cipher form" do
    render

    assert_select "form[action=?][method=?]", transposition_cipher_path(@transposition_cipher), "post" do

      assert_select "input#transposition_cipher_input[name=?]", "transposition_cipher[input]"

      assert_select "input#transposition_cipher_user_id[name=?]", "transposition_cipher[user_id]"

      assert_select "input#transposition_cipher_keyword[name=?]", "transposition_cipher[keyword]"

      assert_select "input#transposition_cipher_output[name=?]", "transposition_cipher[output]"
    end
  end
end
