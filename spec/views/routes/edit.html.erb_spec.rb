require 'rails_helper'

RSpec.describe "routes/edit", type: :view do
  before(:each) do
    @route = assign(:route, Route.create!(

      :name => "MyString",
      :description => "MyText"

    ))
  end

  it "renders the edit route form" do
    render

    assert_select "form[action=?][method=?]", route_path(@route), "post" do


      assert_select "input#route_name[name=?]", "route[name]"

      assert_select "textarea#route_description[name=?]", "route[description]"

    end
  end
end
