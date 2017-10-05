class HouseholdAppliancesController < ApplicationController
  before_action :set_household_appliance, only: [:show, :update, :destroy]

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_household_appliance
      @household_appliance = HouseholdAppliance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def household_appliance_params
      params.require(:household_appliance).permit(:name, :electricity_use, :outlet_id, :category_id)
    end
end
