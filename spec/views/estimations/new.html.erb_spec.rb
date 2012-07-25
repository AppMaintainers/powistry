require 'spec_helper'

describe "estimations/new" do
  before(:each) do
    assign(:estimation, stub_model(Estimation,
      :user => nil,
      :task => nil,
      :complexity => nil
    ).as_new_record)
  end

  it "renders new estimation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => estimations_path, :method => "post" do
      assert_select "input#estimation_user", :name => "estimation[user]"
      assert_select "input#estimation_task", :name => "estimation[task]"
      assert_select "input#estimation_complexity", :name => "estimation[complexity]"
    end
  end
end
