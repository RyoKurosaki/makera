class GetReservationsJob < ActiveJob::Base
  queue_as :default

  def perform(message)
    puts message
  end
end
