class Job < ActiveRecord::Base
  belongs_to :client
  belongs_to :route
  validates :name, :description, :frequency, :estimated_price, {presence: true}
  has_many :work_orders

  def generate_work_order
    jobs = Job.all

    jobs.each do |j|
      seconds = Time.now - j.created_at
      weeks = seconds/60480

      if weeks % j.frequency == 0
        WorkOrder.create(job_id: j.id)
      end
    end
  end
end
