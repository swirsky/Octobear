require 'rails_helper'

RSpec.describe "pages/edit", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :book_id => 1,
      :text => "MyString"
    ))
  end

  it "renders the edit page form" do
    render

    assert_select "form[action=?][method=?]", page_path(@page), "post" do

      assert_select "input#page_book_id[name=?]", "page[book_id]"

      assert_select "input#page_text[name=?]", "page[text]"
    end
  end
end
