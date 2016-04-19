class Job < ActiveRecord::Base
  belongs_to :client
  belongs_to :route
  validates :name, :description, :frequency, :estimated_price, {presence: true}
  has_many :work_orders

  def self.generate_work_order
    current_week = Time.now.strftime('%W').to_i
    jobs = Job.all
    jobs.each do |j|
      seconds = Time.now - j.created_at
      weeks = (seconds/60480).floor
      if weeks % j.frequency.to_i == 0
        work_order = WorkOrder.find_by(job_id: j.id)
        if work_order == nil || work_order.week != current_week
          worder = WorkOrder.new(job_id: j.id, route_id: j.route_id)
          worder.week = current_week
          worder.save
        end
      end
    end
  end

  def self.generate_next_weeks_work_order
    current_week = Time.now.strftime('%W').to_i
    jobs = Job.all
    jobs.each do |j|
      seconds = Time.now - j.created_at
      weeks = (seconds/60480).floor
      weeks += 1
      if weeks % j.frequency.to_i == 0
        work_order = WorkOrder.find_by(job_id: j.id)
        if work_order == nil || work_order.week != (current_week + 1)
          worder = WorkOrder.new(job_id: j.id, route_id: j.route_id)
          worder.week = current_week + 1
          worder.save
        end
      end
    end
  end
end
