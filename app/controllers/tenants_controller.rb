class TenantsController < ApplicationController

  # skip_before_action :authorized, only: [:new, :create]
  # before_action :get_tenant, only: [:edit, :update, :show]

    # def index
    #     @tenants = Tenant.all
    # end

    def show 
        @tenant = Tenant.find(params[:id])
    end

    def login
      @error = flash[:error]
    end
  
    def handle_login
      @tenant = Tenant.find_by(email_address: params[:email_address])
      if @tenant && @tenant.authenticate(params[:password])
        # If the student is found AND their password matches
        session[:tenant_id] = @tenant.id
        redirect_to tenant_path(@tenant)
      else
        flash[:error] = "Incorrect e-mail address or password"
        redirect_to login_path
      end
    end
  
    def logout
      session[:tenant_id] = nil
      redirect_to login_path
    end

    def new
        @errors = flash[:errors]
        @tenant = Tenant.new
        @neighborhoods = Neighborhood.all
        @rental_applications = RentalApplication.all
      end
      
      def create
      @tenant = Tenant.create(tenant_params)
        if @tenant.valid?
          session[:tenant_id] = @tenant.id
          redirect_to new_rental_application_path
        else 
          flash[:errors] = @tenant.errors.full_messages
          redirect_to new_tenant_path
        end
      end
    

      def destroy
        @tenant.destroy
        redirect_to new_tenant_path
      end
    
      private
      def get_tenant
        @tenant = Tenant.find(params[:id])
      end
    
      def tenant_params
        params.require(:tenant).permit(:name, :email_address, :age, :password)
      end
end
