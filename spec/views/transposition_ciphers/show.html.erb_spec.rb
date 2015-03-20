require 'rails_helper'

RSpec.describe "transposition_ciphers/show", type: :view do
  before(:each) do
    @transposition_cipher = assign(:transposition_cipher, TranspositionCipher.create!(
      :input => "Input",
      :user_id => 1,
      :keyword => "Keyword",
      :output => "Output"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Input/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Keyword/)
    expect(rendered).to match(/Output/)
  end
end
