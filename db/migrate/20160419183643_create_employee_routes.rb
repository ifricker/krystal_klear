class CreateEmployeeRoutes < ActiveRecord::Migration
  def change
    create_table :employee_routes do |t|
      t.integer :user_id, null: false
      t.integer :route_id, null: false

      t.timestamps null: false
    end
  end
end
