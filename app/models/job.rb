class Job < ActiveRecord::Base
  belongs_to :client
  belongs_to :route

  validates :name, :description, :frequency, :estimated_price, {presence: true}
end
