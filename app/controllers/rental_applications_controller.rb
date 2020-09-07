class RentalApplicationsController < ApplicationController



    def index
        @rental_applications = RentalApplication.all
    end

    def show
        @rental_application = RentalApplication.find(params[:id])
    end

    def new
        @rental_application = RentalApplication.new
        @errors = flash[:errors]
        @neighborhoods = Neighborhood.all
        @apartments = Apartment.all
    end

    def create
        @rental_application = RentalApplication.create(rental_app_params)
        if @rental_application.valid?
            redirect_to rental_applications_path(@rental_applications)
        else
            flash[:errors] = @rental_application.errors.full_messages
            redirect_to new_rental_application_path
        end
    end

    def delete
        @rental_application.destroy
        redirect to new_rental_application_path
    end

    private

    def rental_app_params
        params.require(:rental_application).permit(:neighborhood, :apartment_address, :description)
    end

end
