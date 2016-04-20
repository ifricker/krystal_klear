class EmployeeWorkorders < ActiveRecord::Migration
  def change
    rename_table :employee_routes, :employee_work_orders
    rename_column :employee_work_orders, :route_id, :work_order_id
  end
end
