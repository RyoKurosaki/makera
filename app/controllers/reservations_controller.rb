class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def get_events
    @reservations = Reservation.all
    render "get_events", :formats => [:json], :handlers => [:jbuilder]
  end

  def get_resources
    @reservations = Reservation.includes(:listing).references(:listings)
    render "get_resources", :formats => [:json], :handlers => [:jbuilder]
  end
end
