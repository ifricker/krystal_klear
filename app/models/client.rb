class Client < ActiveRecord::Base
  has_many :jobs
  validates :business_name, :contact_email, :street_address, :neighborhood, :zip_code, { presence: true }
end
