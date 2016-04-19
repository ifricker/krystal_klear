require 'rails_helper'

RSpec.describe "routes/index", type: :view do
  before(:each) do
    assign(:routes, [
      Route.create!(
        :route_name => "Route Name"
      ),
      Route.create!(
        :route_name => "Route Name"
      )
    ])
  end

  it "renders a list of routes" do
    render
    assert_select "tr>td", :text => "Route Name".to_s, :count => 2
  end
end
