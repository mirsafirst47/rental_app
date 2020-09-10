class RentalApplicationsController < ApplicationController

    def index
        @rental_applications = @current_tenant.rental_applications
    end

    def show
        @rental_application = RentalApplication.find(params[:id])
        # @apartment = Apartment.find(params[:apt_id])
    end

    def new
        @rental_application = RentalApplication.new
        @tenants = Tenant.all
        @apartments = Apartment.all
        @neighborhoods = Neighborhood.all
    end

    def new_form
        @apartment = Apartment.find(params[:apt_id])
        @rental_application = RentalApplication.new
    end

    def create
        # @current_tenant = Tenant.find_by(id: session[:tenant_id])
        @rental_application = @current_tenant.rental_applications.create(rental_app_params)
        redirect_to rental_applications_path
    end

    def destroy
        @rental_application = RentalApplication.find_by(id: params[:id])
        @rental_application.destroy
        redirect_to rental_applications_path
    end

    private

    def rental_app_params
        params.require(:rental_application).permit(:tenant_id, :apartment_id, :description)
    end

end
