class Route < ActiveRecord::Base
  has_many :jobs
  has_many :employee_routes
  has_many :employees, through: :employee_routes, source: :user
  has_many :work_orders

  validates :name, presence: true
  validates :name, uniqueness: true
end
