json.array!(@work_orders) do |work_order|
  json.extract! work_order, :id, :employee_id, :job_id, :final_price, :notes, :complete
  json.url work_order_url(work_order, format: :json)
end
