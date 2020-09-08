class NeighborhoodsController < ApplicationController

    def index
        @neighborhoods = Neighborhood.all
    end

    def show
        @neighborhood = Neighborhood.find(params[:id])
        @apartment = Apartment.find(params[:id])
        @rental_application = RentalApplication.new
    end
end
