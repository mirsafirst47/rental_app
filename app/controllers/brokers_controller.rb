class BrokersController < ApplicationController

    def index
        @brokers = Broker.all
    end

    def show
        @broker = Broker.find(params[:id])
        @apartments = Apartment.all
    end

end
