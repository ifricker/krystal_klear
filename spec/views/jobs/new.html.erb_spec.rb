require 'rails_helper'

RSpec.describe "jobs/new", type: :view do
  before(:each) do
    assign(:job, Job.new(
      :name => "MyString",
      :description => "MyString",
      :frequency => "MyString",
      :estimated_price => 1.5,
      :client_id => 1,
      :route_id => 1
    ))
  end

  it "renders new job form" do
    render

    assert_select "form[action=?][method=?]", jobs_path, "post" do

      assert_select "input#job_name[name=?]", "job[name]"

      assert_select "input#job_description[name=?]", "job[description]"

      assert_select "input#job_frequency[name=?]", "job[frequency]"

      assert_select "input#job_estimated_price[name=?]", "job[estimated_price]"

      assert_select "input#job_client_id[name=?]", "job[client_id]"

      assert_select "input#job_route_id[name=?]", "job[route_id]"
    end
  end
end
