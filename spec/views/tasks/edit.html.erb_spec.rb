require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :user => nil,
      :project => nil,
      :complexity_start => 1,
      :complexity_end => 1,
      :name => "MyString",
      :description => "MyString",
      :invoice_number => "MyString",
      :invested_hours => 1
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path(@task), :method => "post" do
      assert_select "input#task_user", :name => "task[user]"
      assert_select "input#task_project", :name => "task[project]"
      assert_select "input#task_complexity_start", :name => "task[complexity_start]"
      assert_select "input#task_complexity_end", :name => "task[complexity_end]"
      assert_select "input#task_name", :name => "task[name]"
      assert_select "input#task_description", :name => "task[description]"
      assert_select "input#task_invoice_number", :name => "task[invoice_number]"
      assert_select "input#task_invested_hours", :name => "task[invested_hours]"
    end
  end
end
