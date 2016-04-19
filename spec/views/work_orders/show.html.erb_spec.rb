require 'rails_helper'

RSpec.describe "work_orders/show", type: :view do
  before(:each) do
    @work_order = assign(:work_order, WorkOrder.create!(
      :route_id => 1,
      :job_id => 2,
      :final_price => 1.5,
      :notes => "MyText",
      :complete => false
    ))
  end

  @work_order.employees =[User.first]

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(User.first.name)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
