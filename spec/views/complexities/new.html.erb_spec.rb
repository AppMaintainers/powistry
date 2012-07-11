require 'spec_helper'

describe "complexities/new" do
  before(:each) do
    assign(:complexity, stub_model(Complexity,
      :code => "MyString",
      :planned_duration_min => 1,
      :planned_duration_max => 1,
      :points => 1
    ).as_new_record)
  end

  it "renders new complexity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => complexities_path, :method => "post" do
      assert_select "input#complexity_code", :name => "complexity[code]"
      assert_select "input#complexity_planned_duration_min", :name => "complexity[planned_duration_min]"
      assert_select "input#complexity_planned_duration_max", :name => "complexity[planned_duration_max]"
      assert_select "input#complexity_points", :name => "complexity[points]"
    end
  end
end
