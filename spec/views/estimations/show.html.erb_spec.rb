require 'spec_helper'

describe "estimations/show" do
  before(:each) do
    @estimation = assign(:estimation, stub_model(Estimation,
      :user => nil,
      :task => nil,
      :complexity => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
