class WorkOrder < ActiveRecord::Base
  belongs_to :job
  belongs_to :route
  has_many :employees, through: :route
end
