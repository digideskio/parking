class HomeController < ApplicationController
  def home
    if Rails.env.test? || Rails.env.development?
      @current_user_location = '405 Howard Street San Francisco, CA, 94105'
    else
      result = request.location
      @current_user_location = result
      Rails.logger.info(@current_user_location) 
    end
    # if you want to list out the ones near you as well 
      # @bike_parking_spots_within_one_mile = BikeParkingSpot.near(@current_user_location, 0.3)
      # @bike_parking_spots = @bike_parking_spots_within_one_mile.paginate(:page => params[:page], :per_page => 9)
    @bike_parking_spots_nearby = BikeParkingSpot.near(@current_user_location, 0.4)
    @hash = Gmaps4rails.build_markers(@bike_parking_spots_nearby) do |bike_parking_spot, marker|
      marker.lat bike_parking_spot.latitude
      marker.lng bike_parking_spot.longitude
      marker.infowindow bike_parking_spot.location
      marker.infowindow render_to_string(:partial => "bike_parking_spots/info_window.html.erb", :locals => { object: bike_parking_spot })
    end
  end

  def import
  end
end
