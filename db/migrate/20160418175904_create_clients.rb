class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :business_name, null: false
      t.string :contact_email, null: false
      t.string :contact_phone
      t.string :street_address, null: false
      t.string :neighborhood, null: false
      t.string :zip_code, null: false

      t.timestamps null: false
    end
  end
end
