class Route < ActiveRecord::Base
  has_many :jobs
  has_many :employee_routes
  has_many :employees, through: :employee_routes, source: :user
  has_many :work_orders
  has_many :current_week_work_orders, -> {where(week: Time.now.strftime('%W').to_i)}, class_name: 'WorkOrder'

  validates :name, presence: true
  validates :name, uniqueness: true
end
