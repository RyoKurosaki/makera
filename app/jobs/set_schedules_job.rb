class SetSchedulesJob < ActiveJob::Base
  queue_as :schedule

  def perform()
    
  end
end
