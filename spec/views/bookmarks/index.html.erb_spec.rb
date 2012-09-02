require 'spec_helper'

describe "bookmarks/index" do
  before(:each) do
    assign(:bookmarks, [
      stub_model(Bookmark,
        :user => nil,
        :name => "Name",
        :location => "Location"
      ),
      stub_model(Bookmark,
        :user => nil,
        :name => "Name",
        :location => "Location"
      )
    ])
  end

  it "renders a list of bookmarks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end
