require 'rails_helper'

RSpec.describe "WorkOrders", type: :request do
  describe "GET /work_orders" do
    it "works! (now write some real specs)" do
      get work_orders_path
      expect(response).to have_http_status(200)
    end
  end
end
