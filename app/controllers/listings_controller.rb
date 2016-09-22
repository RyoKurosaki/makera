class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update]

  def index
    @listings = Listing.all
  end

  def show
  end

  def edit
    @listing.active_time_start = @listing.active_time_start.strftime('%I:%M %p')
    @listing.active_time_end = @listing.active_time_end.strftime('%I:%M %p')
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(:listing_address, :auto_active_deactive, :active_time_start, :active_time_end, :area, :key, :cleaning_goods, :garbage)
    end
end
