class SchedulesController < ApplicationController
  before_action :authenticate_user!, :set_schedule, only: [:edit, :update]

  def index
  end

  def edit
  end

  def update
    @schedule.update(schedule_params)
    @schedules = Schedule.all
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
    @schedules.each do |schedule|
      if schedule.staff_id.blank?
        schedule.color = 'red'
      end
    end
    render "get_events", :formats => [:json], :handlers => [:jbuilder]
  end

  private
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def schedule_params
      params.require(:schedule).permit(:cleaning_date, :staff_id, :wait_time, :start_time, :end_time)
    end
end
