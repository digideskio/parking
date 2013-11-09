class BikeParkingSpotsController < ApplicationController
  before_action :set_bike_parking_spot, only: [:show, :edit, :update, :destroy]

  def index
    
    if BikeParkingSpot.has_something_near?
      @bike_parking_spots = BikeParkingSpot.closest_to_user.paginate(:page => params[:page], :per_page => 5)
    else
      flash.now[:notice] = "Are you in San Fran? I don't think so..."
    end
  end

  def show
  end

  def import 
    if params[:file]
      BikeParkingSpot.import(params[:file])
      redirect_to root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bike_parking_spot
      @bike_parking_spot = BikeParkingSpot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bike_parking_spot_params
      params.require(:bike_parking_spot).permit(:location, :address, :placement, :racks, :spaces, :coordinates, :latitude, :longitude)
    end
end
