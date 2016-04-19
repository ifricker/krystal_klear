require 'rails_helper'

RSpec.describe "routes/index", type: :view do
  before(:each) do
    assign(:routes, [
      Route.create!(

        :name => "Name",
        :description => "MyText"
      ),
      Route.create!(
        :name => "Name",
        :description => "MyText"

      )
    ])
  end

  it "renders a list of routes" do
    render

    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2

  end
end
