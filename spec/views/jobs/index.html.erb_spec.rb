require 'rails_helper'

RSpec.describe "jobs/index", type: :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        :name => "Name",
        :description => "Description",
        :frequency => "Frequency",
        :estimated_price => 1.5,
        :client_id => 1,
        :route_id => 2
      ),
      Job.create!(
        :name => "Name",
        :description => "Description",
        :frequency => "Frequency",
        :estimated_price => 1.5,
        :client_id => 1,
        :route_id => 2
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Frequency".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
