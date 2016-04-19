class Job < ActiveRecord::Base
  belongs_to :client
  belongs_to :route
end
