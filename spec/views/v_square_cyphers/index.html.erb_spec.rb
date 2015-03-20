require 'rails_helper'

RSpec.describe "v_square_cyphers/index", type: :view do
  before(:each) do
    assign(:v_square_cyphers, [
      VSquareCypher.create!(
        :input => "Input",
        :user_id => 1,
        :output => "Output",
        :codeword => "Codeword"
      ),
      VSquareCypher.create!(
        :input => "Input",
        :user_id => 1,
        :output => "Output",
        :codeword => "Codeword"
      )
    ])
  end

  it "renders a list of v_square_cyphers" do
    render
    assert_select "tr>td", :text => "Input".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Output".to_s, :count => 2
    assert_select "tr>td", :text => "Codeword".to_s, :count => 2
  end
end
