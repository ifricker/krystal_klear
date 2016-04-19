class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :frequency
      t.float :estimated_price, null: false
      t.integer :client_id, null: false
      t.integer :route_id

      t.timestamps null: false
    end
  end
end
