require 'rails_helper'

RSpec.describe "pages/new", type: :view do
  before(:each) do
    assign(:page, Page.new(
      :book_id => 1,
      :text => "MyString"
    ))
  end

  it "renders new page form" do
    render

    assert_select "form[action=?][method=?]", pages_path, "post" do

      assert_select "input#page_book_id[name=?]", "page[book_id]"

      assert_select "input#page_text[name=?]", "page[text]"
    end
  end
end
