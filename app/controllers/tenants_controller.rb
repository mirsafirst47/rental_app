class TenantsController < ApplicationController

  before_action :get_tenant, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized_to_see_page, only: [:login, :handle_login, :new, :create]

  def profile
    render :profile
  end

  def login
    @error = flash[:error]
  end

  def handle_login
    @tenant = Tenant.find_by(email_address: params[:email_address])
    if @tenant && @tenant.authenticate(params[:password])
      # If the tenant is found AND their password matches
      session[:tenant_id] = @tenant.id
      redirect_to welcome_index_path
    else
      flash[:error] = "Incorrect e-mail address or password"
      redirect_to login_path
    end
  end

  def logout
    session[:tenant_id] = nil
    redirect_to login_path
  end


  def index
        @tenants = Tenant.all
  end

  def show 
    
    @tenant = Tenant.find(params[:id])
    @apartment = Apartment.find(params[:id])
  end

  def new
    if check_if_tenant_is_logged_in?
      redirect_to welcome_index_path
    else
      @errors = flash[:errors]
      @tenant = Tenant.new
      render :new
    end
  end
  
  def create
    @tenant = Tenant.create(tenant_params)
    if @tenant.valid?
      session[:tenant_id] = @tenant.id
      redirect_to welcome_index_path
    else 
      flash[:errors] = @tenant.errors.full_messages
      redirect_to new_tenant_path
    end
    
  end

  def edit
    @tenant = @current_tenant
  end

  def update
    @tenant.update(tenant_params)
    redirect_to welcome_index_path
  end

  def destroy
    
    @tenant.destroy
    redirect_to login_path
  end

  private
  def get_tenant
    @tenant = Tenant.find(params[:id])
  end

  def tenant_params
    params.require(:tenant).permit(:name, :email_address, :age, :password)
  end
end
