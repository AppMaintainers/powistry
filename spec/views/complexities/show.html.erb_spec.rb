require 'spec_helper'

describe "complexities/show" do
  before(:each) do
    @complexity = assign(:complexity, stub_model(Complexity,
      :code => "Code",
      :planned_duration_min => 1,
      :planned_duration_max => 2,
      :points => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
