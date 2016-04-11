class HostRegisterJob < ActiveJob::Base
  queue_as :host

  def perform(host_params)
    unless Utils::CommonUtil.regist_host(host_params)
      Utils::CommonUtil.restart_heroku
    end
  end
end
