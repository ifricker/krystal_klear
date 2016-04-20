class WorkOrder < ActiveRecord::Base
  belongs_to :job
  belongs_to :route
  has_many :employee_work_orders
  has_many :employees, through: :employee_work_orders, source: :user


  def incomplete?
    self.complete == "incomplete"
  end

  def complete?
    self.complete == "complete"
  end

  def passed?
    self.complete == "pass"
  end

end
