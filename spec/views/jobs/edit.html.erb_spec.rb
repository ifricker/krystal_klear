require 'rails_helper'

RSpec.describe "jobs/edit", type: :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :name => "MyString",
      :description => "MyString",
      :frequency => "MyString",
      :estimated_price => 1.5,
      :client_id => 1,
      :route_id => 1
    ))
  end

  it "renders the edit job form" do
    render

    assert_select "form[action=?][method=?]", job_path(@job), "post" do

      assert_select "input#job_name[name=?]", "job[name]"

      assert_select "input#job_description[name=?]", "job[description]"

      assert_select "input#job_frequency[name=?]", "job[frequency]"

      assert_select "input#job_estimated_price[name=?]", "job[estimated_price]"

      assert_select "input#job_client_id[name=?]", "job[client_id]"

      assert_select "input#job_route_id[name=?]", "job[route_id]"
    end
  end
end
