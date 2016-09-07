class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def get_events
    if current_user.admin?
      @schedules = Schedule.joins(:reservation).preload(:reservation)\
                           .joins(:listing).preload(:listing)\
                           .joins("INNER JOIN users as owners ON cast(owners.id as char) = schedules.user_id")\
                           .joins("LEFT OUTER JOIN users as staffs ON cast(staffs.id as char) = schedules.staff_id")\
                           .select("schedules.*, owners.name as owner_name, owners.email as owner_email, staffs.name as staff_name")
    else
      @schedules = Schedule.joins(:reservation).preload(:reservation)\
                           .joins(:listing).preload(:listing)\
                           .joins("INNER JOIN users as owners ON cast(owners.id as char) = schedules.user_id")\
                           .joins("LEFT OUTER JOIN users as staffs ON cast(staffs.id as char) = schedules.staff_id")\
                           .where(owners: {id: current_user.id})
                           .select("schedules.*, owners.name as owner_name, owners.email as owner_email, staffs.name as staff_name")
    end
    render "get_events", :formats => [:json], :handlers => [:jbuilder]
  end
end
