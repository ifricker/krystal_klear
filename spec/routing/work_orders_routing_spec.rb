require "rails_helper"

RSpec.describe WorkOrdersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/work_orders").to route_to("work_orders#index")
    end

    it "routes to #new" do
      expect(:get => "/work_orders/new").to route_to("work_orders#new")
    end

    it "routes to #show" do
      expect(:get => "/work_orders/1").to route_to("work_orders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/work_orders/1/edit").to route_to("work_orders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/work_orders").to route_to("work_orders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/work_orders/1").to route_to("work_orders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/work_orders/1").to route_to("work_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/work_orders/1").to route_to("work_orders#destroy", :id => "1")
    end

  end
end
