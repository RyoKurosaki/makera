class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def get_events
    if current_user.admin?
      @schedules = Schedule.all
    else
      @schedules = Schedule.where("user_email = ?", current_user.email)
    end
    render "get_events", :formats => [:json], :handlers => [:jbuilder]
  end
end
