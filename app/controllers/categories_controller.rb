class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all

    render json: @categories
  end

  # GET /categories/1
  def show
    render json: @category
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  # GET /users/user_id/categories
  def my_categories
    @categories = Category.where("user_id = ?", params[:user_id])
    if @categories
      render json: @categories
    else
      render json: "error"
    end
  end

  # GET /categories/:category_id/turn
  def turn
    @household_appliances = HouseholdAppliance.where("category_id = ?", params[:category_id])
    for appliance in @household_appliances
      if appliance.outlet_id
        @outlet = Outlet.find(appliance.outlet_id)
        @outlet.update(estate: params[:nestate])
        
      else
        render json: "paila perrito"
      end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name, :user_id)
    end
end
