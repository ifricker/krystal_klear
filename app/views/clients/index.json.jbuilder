json.array!(@clients) do |client|
  json.extract! client, :id, :business_name, :contact_email, :contact_phone, :street_address, :neighborhood, :ZIP_code, :frequency, :payment, :route_id
  json.url client_url(client, format: :json)
end
