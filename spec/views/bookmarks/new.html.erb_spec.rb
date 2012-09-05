require 'spec_helper'

describe "bookmarks/new" do
  before(:each) do
    assign(:bookmark, stub_model(Bookmark,
      :user => nil,
      :name => "MyString",
      :location => "MyString"
    ).as_new_record)
  end

  it "renders new bookmark form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bookmarks_path, :method => "post" do
      assert_select "input#bookmark_user", :name => "bookmark[user]"
      assert_select "input#bookmark_name", :name => "bookmark[name]"
      assert_select "input#bookmark_location", :name => "bookmark[location]"
    end
  end
end
