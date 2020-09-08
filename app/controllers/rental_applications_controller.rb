class RentalApplicationsController < ApplicationController

    def index
        @rental_applications = @current_tenant.rental_applications
    end

    def show
        @rental_application = RentalApplication.find(params[:id])
    end

    def new
        @rental_application = RentalApplication.new
        @tenants = Tenant.all
        @apartments = Apartment.all
        @neighborhoods = Neighborhood.all
    end

    def create
        @rental_application = @current_tenant.rental_applications.create(rental_app_params)
        redirect_to tenant_path(@current_tenant)
        # if @rental_application.valid?
        #     redirect_to rental_applications_path(@rental_applications)
        # else
        #     flash[:errors] = @rental_application.errors.full_messages
        #     redirect_to new_rental_application_path
        # end
    end

    def delete
        @rental_application.destroy
        redirect to new_rental_application_path
    end

    private

    def rental_app_params
        params.require(:rental_application).permit(:tenant_id, :apartment_id, :description)
    end

end
