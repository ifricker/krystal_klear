class WorkOrder < ActiveRecord::Base
  belongs_to :job
  belongs_to :route
  has_many :employees, through: :route


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
