require 'rails_helper'

RSpec.describe "Jobs", type: :request do
  describe "GET /jobs" do
    it "works! (now write some real specs)" do
      client = Client.create!(business_name: "business", contact_email: "john@doe.com", contact_phone: "1234567890", street_address: "123 ok", neighborhood: "ok", zip_code: "74055")
      job = Job.new(name: "name", description: "describes a job", frequency: "weekly", estimated_price: 125.50, route_id: 1)
      job.client = client
      job.save
      get client_job_path(client, job)
      expect(response).to have_http_status(200)
    end
  end
end
