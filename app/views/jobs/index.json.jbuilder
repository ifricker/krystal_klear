json.array!(@jobs) do |job|
  json.extract! job, :id, :name, :description, :frequency, :estimated_price, :client_id, :route_id
  json.url job_url(job, format: :json)
end
