class Route < ActiveRecord::Base
  has_many :jobs
  has_many :employees, class_name: :user
  has_many :work_orders

  validates :name, presence: true
  validates :name, uniqueness: true
end
