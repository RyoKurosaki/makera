class HostsController < ApplicationController
  before_action :set_host, only: [:show, :edit, :update, :destroy]

  # GET /hosts
  # GET /hosts.json
  def index
    @hosts = Host.all
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
    require 'net/http'
    header = Constants::AIRBNB_CONFIG
    url = URI.parse("https://api.airbnb.com/v1/authorize")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE

    req = Net::HTTP::Post.new(url.path, header)

    req.set_form_data({'username' => host_params["email"], 'password' => host_params["password"], 'prevent_account_creation' => 'true'})
    res = https.start do |http|
      http.request(req)
    end
    hash = host_params
    hash["access_token"] = JSON.parse(res.body)["access_token"]

    header["X-Airbnb-OAuth-Token"] = hash["access_token"]
    url = URI.parse("https://api.airbnb.com/v1/account/active")
    req = Net::HTTP::Get.new(url.path, header)
    res = https.start do |http|
      http.request(req)
    end
    user = JSON.parse(res.body)['user']
    host_id = user['user']['id']
    host_name = user['user']['first_name']

    @host = Host.new(hash)

    respond_to do |format|
      if @host.save
        format.html { redirect_to @host, notice: 'Host was successfully created.' }
        format.json { render :show, status: :created, location: @host }
      else
        format.html { render :new }
        format.json { render json: @host.errors, status: :unprocessable_entity }
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
