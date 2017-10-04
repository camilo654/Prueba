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

    # GET /rooms/room_id/outlets
    def show_mine
      @outlets = Outlet.where("room_id = ?", params[:room_id])
      if @outlets
        render json: @outlets
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
