require 'spec_helper'

describe "complexities/index" do
  before(:each) do
    assign(:complexities, [
      stub_model(Complexity,
        :code => "Code",
        :planned_duration_min => 1,
        :planned_duration_max => 2,
        :points => 3
      ),
      stub_model(Complexity,
        :code => "Code",
        :planned_duration_min => 1,
        :planned_duration_max => 2,
        :points => 3
      )
    ])
  end

  it "renders a list of complexities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
