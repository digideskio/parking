class BikeParkingSpotsController < ApplicationController
  before_action :set_bike_parking_spot, only: [:show, :edit, :update, :destroy]

  def index
    if Rails.env.test? || Rails.env.development?
      current_user_address = 'San Francisco, CA 94105'
    else
      current_user_address = request.location.address
      Rails.logger.info(current_user_location)
    end
    
    within_one_mile = BikeParkingSpot.near(current_user_address, 0.4)
    @bike_parking_spots = within_one_mile.paginate(:page => params[:page], :per_page => 9)
    
  end

  def show
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
