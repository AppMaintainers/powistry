require 'spec_helper'

describe "tasks/show" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :user => nil,
      :project => nil,
      :complexity => "",
      :end_complexity_id => 1,
      :name => "Name",
      :description => "Description",
      :invoice_number => "Invoice Number",
      :invested_hours => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/Invoice Number/)
    rendered.should match(/2/)
  end
end
