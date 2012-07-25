require 'spec_helper'

describe "estimations/index" do
  before(:each) do
    assign(:estimations, [
      stub_model(Estimation,
        :user => nil,
        :task => nil,
        :complexity => nil
      ),
      stub_model(Estimation,
        :user => nil,
        :task => nil,
        :complexity => nil
      )
    ])
  end

  it "renders a list of estimations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
