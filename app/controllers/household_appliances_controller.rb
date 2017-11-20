class HouseholdAppliancesController < ApplicationController
  before_action :set_household_appliance, only: [:show, :update, :destroy]


  @@ary = Array.new
  @@user = String.new

  # GET /household_appliances
  def index
    @household_appliances = HouseholdAppliance.all

    render json: @household_appliances
  end

  # GET /household_appliances/1
  def show
    render json: @household_appliance
  end

  # POST /household_appliances
  def create
    @household_appliance = HouseholdAppliance.new(household_appliance_params)

    if @household_appliance.save
      render json: @household_appliance, status: :created, location: @household_appliance
    else
      render json: @household_appliance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /household_appliances/1
  def update
    if @household_appliance.update(household_appliance_params)
      render json: @household_appliance
    else
      render json: @household_appliance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /household_appliances/1
  def destroy
    @household_appliance.destroy
  end

  #Ruta
  def total_consumption
    @household_appliances = HouseholdAppliance.where("user_id = ?", params[:user_id])
    @current_consumption = 0
    for appliance in @household_appliances
      if appliance.outlet_id
        @outlet = Outlet.find(appliance.outlet_id)
        if !(@outlet.estate)
          @current_consumption = @current_consumption + appliance.consumption
        else
          initial = @outlet.updated_at
          final = Time.now
          @appliance_consumption = appliance.consumption + (final - initial)/3600*appliance.electricity_use
          @current_consumption = @current_consumption + @appliance_consumption
          @outlet.update(updated_at: Time.now)
          appliance.update(consumption: @appliance_consumption)
        end
      end
    end
    render json: @current_consumption
  end

  # GET /users/user_id/household_appliances
   def my_appliances
    @household_appliances = HouseholdAppliance.where("user_id = ?", params[:user_id])
    if @household_appliances
      render json: @household_appliances
    else
      render json: "error"
    end
  end 

  
  #GET /users/user_id/available

  def appliances_available
    @appliances = Array.new
    @household_appliances = HouseholdAppliance.where("user_id = ?", params[:user_id])

    if @household_appliances
      for appliance in @household_appliances
        if !appliance.outlet_id
          @appliances.push(appliance)
        end
      end
      render json: @appliances
    else
      render json: "error"
    end
  end

    #GET /users/user_id/nocat

    def appliances_nocat
      @appliances = Array.new
      @household_appliances = HouseholdAppliance.where("user_id = ?", params[:user_id])
  
      if @household_appliances
        for appliance in @household_appliances
          if !appliance.category_id
            @appliances.push(appliance)
          end
        end
        render json: @appliances
      else
        render json: "error"
      end
    end

  # GET /categories/:category_id/household_appliances
    def in_category
      @household_appliances = HouseholdAppliance.where("category_id = ?", params[:category_id])
      if @household_appliances
        render json: @household_appliances
      else
        render json: "error"
      end
    end


    # GET /users/:user_id/current_consumption
    def current_consumption

        @household_appliances = HouseholdAppliance.where("user_id = ?", params[:user_id])
        @current_consumption = 0
        for appliance in @household_appliances
          if appliance.outlet_id
            @outlet = Outlet.find(appliance.outlet_id)
            if @outlet.estate
              @current_consumption = @current_consumption + appliance.electricity_use
            end
          end
        end

        if @@ary.length  == 0 or @@user!=params[:user_id]

          @@ary  = Array.new(16,@current_consumption)

        else
              @@ary .push(@current_consumption)
              @@ary .shift()
        end
        @@user = params[:user_id]
        #render json: @current_consumption
        render json: @@ary
      end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_household_appliance
      @household_appliance = HouseholdAppliance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def household_appliance_params
      params.require(:household_appliance).permit(:name, :electricity_use, :consumption, :outlet_id, :category_id, :user_id)
    end
end
