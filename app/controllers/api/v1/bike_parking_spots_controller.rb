module Api
  module V1
    class BikeParkingSpotsController < ApplicationController
      respond_to :json

      def index
        respond_with BikeParkingSpot.all
      end
    end
  end
end