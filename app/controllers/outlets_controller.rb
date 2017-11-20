class OutletsController < ApplicationController
  before_action :set_outlet, only: [:show, :update, :destroy]

  # GET /outlets
  def index
    @outlets = Outlet.all

    render json: @outlets
  end

  # GET /outlets/1
  def show
    render json: @outlet
  end

  # POST /outlets
  def create
    @outlet = Outlet.new(outlet_params)
    if @outlet.save
      render json: @outlet, status: :created, location: @outlet
    else
      render json: @outlet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /outlets/1
  def update
    #@household_appliances = HouseholdAppliance.where("user_id = ?", params[:room_id])
    # for appliance in @household_appliances
    #     if appliance.outlet_id
    #       @outlet = Outlet.find(appliance.outlet_id)
    #       puts out
    if @outlet.update(outlet_params)
      render json: @outlet
    else
      render json: @outlet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /outlets/1
  def destroy
    @outlet.destroy
  end

  #Definir ruta
  def consumption
    @outlet = Outlet.find(params[:outlet_id])
    @outlet.consumption(@outlet.id)
  end

    # GET /rooms/room_id/outlets
    def show_mine
      @outlets = Outlet.where("room_id = ?", params[:room_id])
      if @outlets
        render json: @outlets
      else
        render json: "error"
      end
    end

  # GET /users/:user_id/percent
  def percent
    @percent = 0
    @turn_on = 0
    @moutlets = Array.new
    @rooms = Room.where("user_id = ?", params[:user_id])
     for room in @rooms
      @outlets = Outlet.where(room_id: room.id)
      for outlet in @outlets
        @moutlets.push(outlet)
      end
     end

     if @moutlets
      for moutlet in @moutlets
        if moutlet.estate
          @turn_on = @turn_on + 1
        end
      end
      @percent = (@turn_on*100)/(@moutlets.length)
      #puts @turn_on
      #puts @moutlets.length
      render json: @percent
     else
      render json: "error"
     end
  end 
  
    # GET /outlets/outlet_id/household_appliances
    def my_appliance
      @appliance =  HouseholdAppliance.where("outlet_id = ?", params[:outlet_id])
      if @appliance
        render json: @appliance
      else
        render json: "error"
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outlet
      @outlet = Outlet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def outlet_params
      params.require(:outlet).permit(:estate, :room_id)
    end
end
