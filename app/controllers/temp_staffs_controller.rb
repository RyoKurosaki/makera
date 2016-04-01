class TempStaffsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :thanks]
  before_action :set_temp_staff, except: [:index, :new, :create, :thanks]

  # GET /temp_staffs
  # GET /temp_staffs.json
  def index
    @temp_staffs = TempStaff.all
  end

  # GET /temp_staffs/new
  def new
    @temp_staff = TempStaff.new
  end

  # GET /temp_staffs/1/edit
  def edit
  end

  # POST /temp_staffs
  # POST /temp_staffs.json
  def create
    @temp_staff = TempStaff.new(temp_staff_params)

    respond_to do |format|
      if @temp_staff.save
        format.html { redirect_to thanks_temp_staffs_path, notice: 'Temp staff was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @temp_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temp_staffs/1
  # PATCH/PUT /temp_staffs/1.json
  def update
    respond_to do |format|
      if @temp_staff.update(temp_staff_params)
        format.html { redirect_to temp_staffs_path, notice: 'Temp staff was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @temp_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  def thanks
  end

  # DELETE /temp_staffs/1
  # DELETE /temp_staffs/1.json
  def destroy
    @temp_staff.destroy
    respond_to do |format|
      format.html { redirect_to temp_staffs_url, notice: 'Temp staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    require 'utils/common_util'
    @user = User.new
    @user.name = @temp_staff.name
    @user.email = @temp_staff.email
    @user.password = Utils::CommonUtil.password_gen
    respond_to do |format|
      if @user.save
        @temp_staff.destroy
        RegisteredMailerJob.perform_later(@user, @user.password)
        format.html { redirect_to temp_staffs_url, notice: 'Temp staff was successfully resisted as regular staff.' }
        format.json { head :no_content }
      else
        format.html { redirect_to temp_staffs_url, notice: 'Temp staff was not resisted. please tell the administrator' }
        format.json { render json: @temp_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temp_staff
      @temp_staff = TempStaff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def temp_staff_params
      params.require(:temp_staff).permit(:name, :email, :tel, :interview_request_date, :interview_date, :line_id, :inquiry)
    end
end
