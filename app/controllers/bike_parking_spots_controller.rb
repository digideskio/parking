class BikeParkingSpotsController < ApplicationController
  before_action :set_bike_parking_spot, only: [:show, :edit, :update, :destroy]

  # GET /bike_parking_spots.json
  def index
    if Rails.env.test? || Rails.env.development?
      current_user_location = '405 Howard Street San Francisco, CA, 94105'
    else
      current_user_location = request.location.address
    end
    # if you want to list out the ones near you as well 
      # @bike_parking_spots_within_one_mile = BikeParkingSpot.near(@current_user_location, 0.3)
      # @bike_parking_spots = @bike_parking_spots_within_one_mile.paginate(:page => params[:page], :per_page => 9)
 
    @bike_parking_spots_nearby = BikeParkingSpot.near(current_user_location, 0.3)
  
    @hash = Gmaps4rails.build_markers(@bike_parking_spots_nearby) do |bike_parking_spot, marker|
      marker.lat bike_parking_spot.latitude
      marker.lng bike_parking_spot.longitude
      marker.infowindow bike_parking_spot.location
      marker.infowindow render_to_string(:partial => "bike_parking_spots/info_window.html.erb", :locals => { object: bike_parking_spot })
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
    if params[:file]
      BikeParkingSpot.import(params[:file])
      redirect_to root_url, notice: "Uploaded Everything"
    end
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
