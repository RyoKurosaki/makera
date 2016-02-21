class ReservationsController < ApplicationController
  def index
  end

  def get_events
    @reservations = Reservation.all

    # reservation1 = {"id" => 1, "title" => 'test1', "start" => '2016-02-22', "end" => '2016-02-23'}
    # reservation2 = {"id" => 2, "title" => 'test2', "start" => '2016-02-25', "end" => '2016-02-27'}
    # reservations = [reservation1, reservation2]
    render "get_events", :formats => [:json], :handlers => [:jbuilder]
  end
end
