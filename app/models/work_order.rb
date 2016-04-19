class WorkOrder < ActiveRecord::Base
  belongs_to :job
  belongs_to :employee, source: :user
end
