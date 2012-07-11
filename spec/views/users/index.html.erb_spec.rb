require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :monogram => "Monogram",
        :admin => false
      ),
      stub_model(User,
        :name => "Name",
        :monogram => "Monogram",
        :admin => false
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Monogram".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
