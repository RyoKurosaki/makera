class ReservationsController < ApplicationController
  def index
  end

  def get_events
    @reservations = Reservation.all
    render "get_events", :formats => [:json], :handlers => [:jbuilder]
  end

  def get_resources
    @reservations = Reservation.all
    render "get_resources", :formats => [:json], :handlers => [:jbuilder]
  end
end
