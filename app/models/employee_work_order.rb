class EmployeeWorkOrder < ActiveRecord::Base
  belongs_to :user
  belongs_to :work_order
end
