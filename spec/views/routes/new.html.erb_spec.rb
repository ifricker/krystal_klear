require 'rails_helper'

RSpec.describe "routes/new", type: :view do
  before(:each) do
    assign(:route, Route.new(

      :name => "MyString",
      :description => "MyText"

    ))
  end

  it "renders new route form" do
    render

    assert_select "form[action=?][method=?]", routes_path, "post" do


      assert_select "input#route_name[name=?]", "route[name]"

      assert_select "textarea#route_description[name=?]", "route[description]"

    end
  end
end
