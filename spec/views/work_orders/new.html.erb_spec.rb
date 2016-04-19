require 'rails_helper'

RSpec.describe "work_orders/new", type: :view do
  before(:each) do
    assign(:work_order, WorkOrder.new(
      :employee_id => 1,
      :job_id => 1,
      :final_price => 1.5,
      :notes => "MyText",
      :complete => false
    ))
  end

  it "renders new work_order form" do
    render

    assert_select "form[action=?][method=?]", work_orders_path, "post" do

      assert_select "input#work_order_employee_id[name=?]", "work_order[employee_id]"

      assert_select "input#work_order_job_id[name=?]", "work_order[job_id]"

      assert_select "input#work_order_final_price[name=?]", "work_order[final_price]"

      assert_select "textarea#work_order_notes[name=?]", "work_order[notes]"

      assert_select "input#work_order_complete[name=?]", "work_order[complete]"
    end
  end
end
