require 'spec_helper'

describe "tasks/index" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task,
        :user => nil,
        :project => nil,
        :complexity => "",
        :end_complexity_id => 1,
        :name => "Name",
        :description => "Description",
        :invoice_number => "Invoice Number",
        :invested_hours => 2
      ),
      stub_model(Task,
        :user => nil,
        :project => nil,
        :complexity => "",
        :end_complexity_id => 1,
        :name => "Name",
        :description => "Description",
        :invoice_number => "Invoice Number",
        :invested_hours => 2
      )
    ])
  end

  it "renders a list of tasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Invoice Number".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
