require 'test_helper'

class BikeParkingSpotsControllerTest < ActionController::TestCase
  setup do
    @bike_parking_spot = bike_parking_spots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bike_parking_spots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bike_parking_spot" do
    assert_difference('BikeParkingSpot.count') do
      post :create, bike_parking_spot: { address: @bike_parking_spot.address, coordinates: @bike_parking_spot.coordinates, latitude: @bike_parking_spot.latitude, location: @bike_parking_spot.location, longitude: @bike_parking_spot.longitude, placement: @bike_parking_spot.placement, racks: @bike_parking_spot.racks, spaces: @bike_parking_spot.spaces }
    end

    assert_redirected_to bike_parking_spot_path(assigns(:bike_parking_spot))
  end

  test "should show bike_parking_spot" do
    get :show, id: @bike_parking_spot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bike_parking_spot
    assert_response :success
  end

  test "should update bike_parking_spot" do
    patch :update, id: @bike_parking_spot, bike_parking_spot: { address: @bike_parking_spot.address, coordinates: @bike_parking_spot.coordinates, latitude: @bike_parking_spot.latitude, location: @bike_parking_spot.location, longitude: @bike_parking_spot.longitude, placement: @bike_parking_spot.placement, racks: @bike_parking_spot.racks, spaces: @bike_parking_spot.spaces }
    assert_redirected_to bike_parking_spot_path(assigns(:bike_parking_spot))
  end

  test "should destroy bike_parking_spot" do
    assert_difference('BikeParkingSpot.count', -1) do
      delete :destroy, id: @bike_parking_spot
    end

    assert_redirected_to bike_parking_spots_path
  end
end
