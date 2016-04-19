class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_last_work_ordered_week

  def after_sign_in_path_for(resource_or_scope)
   current_user
  end

  def check_last_work_ordered_week
    if WorkOrder.count > 0
      work_order = WorkOrder.order("created_at desc").first
      return @last_work_order_week = work_order.week
    else
      return 0
    end
  end

end
