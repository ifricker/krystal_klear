class Job < ActiveRecord::Base
  belongs_to :client
  belongs_to :route
  has_many :work_orders

  def generate_work_order
    jobs = Job.all

    jobs.each do |j|
      seconds = Time.now - j.created_at
      weeks = seconds/60480
      days = j.frequency * 7

      if weeks % days == 0
        work_order = WorkOrder.create(job_id: j.id)
      end
    end
  end
end
