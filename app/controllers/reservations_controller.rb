class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def get_events
    if current_user.admin?
      @reservations = Reservation.all
    else
      @reservations = Reservation.where("user_email = ?", current_user.email)
    end
    render "get_events", :formats => [:json], :handlers => [:jbuilder]
  end

  def get_resources
    if current_user.admin?
      @reservations = Reservation.includes(:listing).references(:listings)
    else
      @reservations = Reservation.includes(:listing).references(:listings).where("user_email = ?", current_user.email)
    end
    render "get_resources", :formats => [:json], :handlers => [:jbuilder]
  end
end
