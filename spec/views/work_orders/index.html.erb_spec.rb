require 'rails_helper'

RSpec.describe "work_orders/index", type: :view do
  before(:each) do
    assign(:work_orders, [
      WorkOrder.create!(
        :employee_id => 1,
        :job_id => 2,
        :final_price => 1.5,
        :notes => "MyText",
        :complete => false
      ),
      WorkOrder.create!(
        :employee_id => 1,
        :job_id => 2,
        :final_price => 1.5,
        :notes => "MyText",
        :complete => false
      )
    ])
  end

  it "renders a list of work_orders" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
