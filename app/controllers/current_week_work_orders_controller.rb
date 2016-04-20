class CurrentWeekWorkOrdersController < ApplicationController

  def update
    @route = Route.find(params[:id])
    @route.current_week_work_orders.each do |wo|
      wo.employees = User.find(params[:employees])
    end
    redirect_to '/'
  end

end
