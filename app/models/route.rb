class Route < ActiveRecord::Base
  has_many :jobs
  has_many :employees, class_name: :user

  validates :name, presence: true
  validates :name, uniqueness: true
end
