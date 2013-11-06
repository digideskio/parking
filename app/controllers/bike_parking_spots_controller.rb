class BikeParkingSpotsController < ApplicationController
  before_action :set_bike_parking_spot, only: [:show, :edit, :update, :destroy]

  # GET /bike_parking_spots.json
  def index
    # in production get the ip address with this result variable
    # @result = request.location
    @bike_parking_spots_nearby = BikeParkingSpot.near('66 Mint St, San Francisco, California', 0.2)
    @bike_parking_spots_within_one_mile = BikeParkingSpot.near('66 Mint St, San Francisco, California', 2)
    @bike_parking_spots = @bike_parking_spots_within_one_mile.paginate(:page => params[:page], :per_page => 9)

    @hash = Gmaps4rails.build_markers(@bike_parking_spots_nearby) do |bike_parking_spot, marker|
      marker.lat bike_parking_spot.latitude
      marker.lng bike_parking_spot.longitude
      marker.infowindow bike_parking_spot.location 
    end
  end

  def show
  end

  def new
    @bike_parking_spot = BikeParkingSpot.new
  end


  def edit
  end

  # POST /bike_parking_spots.json
  def create
    @bike_parking_spot = BikeParkingSpot.new(bike_parking_spot_params)

    respond_to do |format|
      if @bike_parking_spot.save
        format.html { redirect_to @bike_parking_spot, notice: 'Bike parking spot was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bike_parking_spot }
      else
        format.html { render action: 'new' }
        format.json { render json: @bike_parking_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bike_parking_spots/1.json
  def update
    respond_to do |format|
      if @bike_parking_spot.update(bike_parking_spot_params)
        format.html { redirect_to @bike_parking_spot, notice: 'Bike parking spot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bike_parking_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  def import 
    BikeParkingSpot.import(params[:file])
    redirect_to root_url, notice: "Uploaded Everything"
  end

  # DELETE /bike_parking_spots/1.json
  def destroy
    @bike_parking_spot.destroy
    respond_to do |format|
      format.html { redirect_to bike_parking_spots_url }
      format.json { head :no_content }
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
