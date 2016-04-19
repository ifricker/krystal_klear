require 'rails_helper'

RSpec.describe "work_orders/edit", type: :view do
  before(:each) do
    @work_order = assign(:work_order, WorkOrder.create!(
      :employee_id => 1,
      :job_id => 1,
      :final_price => 1.5,
      :notes => "MyText",
      :complete => false
    ))
  end

  it "renders the edit work_order form" do
    render

    assert_select "form[action=?][method=?]", work_order_path(@work_order), "post" do

      assert_select "input#work_order_employee_id[name=?]", "work_order[employee_id]"

      assert_select "input#work_order_job_id[name=?]", "work_order[job_id]"

      assert_select "input#work_order_final_price[name=?]", "work_order[final_price]"

      assert_select "textarea#work_order_notes[name=?]", "work_order[notes]"

      assert_select "input#work_order_complete[name=?]", "work_order[complete]"
    end
  end
end
