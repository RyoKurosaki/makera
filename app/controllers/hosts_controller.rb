class HostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_host, except: [:index, :new, :create]

  # GET /hosts
  # GET /hosts.json
  def index
    @hosts = Host.where("user_id = ?", current_user.id.to_s)
  end

  # GET /hosts/1
  # GET /hosts/1.json
  def show
  end

  # GET /hosts/new
  def new
    @host = Host.new
  end

  # GET /hosts/1/edit
  def edit
  end

  # POST /hosts
  # POST /hosts.json
  def create
    add_current_user = host_params
    add_current_user["user_id"] = current_user.id
    respond_to do |format|
      if Utils::CommonUtil.regist_host(add_current_user)
        @host = Host.where("email = ?", add_current_user["email"]).first
        format.html { redirect_to @host, notice: 'Host was successfully created.' }
        format.json { render :show, status: :created, location: @host }
      else
        Utils::CommonUtil.restart_heroku
        format.html { redirect_to hosts_url, notice: 'AirbnbがBusy状態のため後ほど登録されます。このままお待ちください。' }
      end
    end
  end

  # PATCH/PUT /hosts/1
  # PATCH/PUT /hosts/1.json
  def update
    respond_to do |format|
      if @host.update(host_params)
        format.html { redirect_to @host, notice: 'Host was successfully updated.' }
        format.json { render :show, status: :ok, location: @host }
      else
        format.html { render :edit }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hosts/1
  # DELETE /hosts/1.json
  def destroy
    Reservation.where("host_id = ?", @host.host_id).destroy_all
    Listing.where("host_id = ?", @host.host_id).destroy_all
    @host.destroy
    respond_to do |format|
      format.html { redirect_to hosts_url, notice: 'Host was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host
      @host = Host.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def host_params
      params.require(:host).permit(:email, :password, :access_token)
    end
end
