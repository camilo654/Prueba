class DomicilesController < ApplicationController
  before_action :set_domicile, only: [:show, :update, :destroy]

  # GET /domiciles
  def index
    @domiciles = Domicile.all

    render json: @domiciles
  end

  # GET /domiciles/1
  def show
    render json: @domicile
  end

  # POST /domiciles
  def create
    @domicile = Domicile.new(domicile_params)

    if @domicile.save
      render json: @domicile, status: :created, location: @domicile
    else
      render json: @domicile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /domiciles/1
  def update
    if @domicile.update(domicile_params)
      render json: @domicile
    else
      render json: @domicile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /domiciles/1
  def destroy
    @domicile.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domicile
      @domicile = Domicile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def domicile_params
      params.require(:domicile).permit(:address, :city, :user_id)
    end
end
