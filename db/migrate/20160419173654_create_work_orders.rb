class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.integer :route_id
      t.integer :job_id, null: false
      t.float :final_price
      t.text :notes
      t.integer :week
      t.string :complete, default: 'incomplete'

      t.timestamps null: false
    end
  end
end
