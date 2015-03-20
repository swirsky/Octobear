require 'rails_helper'

RSpec.describe "transposition_ciphers/index", type: :view do
  before(:each) do
    assign(:transposition_ciphers, [
      TranspositionCipher.create!(
        :input => "Input",
        :user_id => 1,
        :keyword => "Keyword",
        :output => "Output"
      ),
      TranspositionCipher.create!(
        :input => "Input",
        :user_id => 1,
        :keyword => "Keyword",
        :output => "Output"
      )
    ])
  end

  it "renders a list of transposition_ciphers" do
    render
    assert_select "tr>td", :text => "Input".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Keyword".to_s, :count => 2
    assert_select "tr>td", :text => "Output".to_s, :count => 2
  end
end
