require 'rails_helper'

RSpec.describe "routes/show", type: :view do
  before(:each) do
    @route = assign(:route, Route.create!(
      :route_name => "Route Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Route Name/)
  end
end
