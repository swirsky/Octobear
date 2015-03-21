require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  before(:each) do
    assign(:pages, [
      Page.create!(
        :book_id => 1,
        :text => "Text"
      ),
      Page.create!(
        :book_id => 1,
        :text => "Text"
      )
    ])
  end

  it "renders a list of pages" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
