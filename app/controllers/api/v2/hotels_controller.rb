class Api::V2::HotelsController < ApplicationController
  before_action :set_api_v2_hotel, only: %i[ show update destroy ]

  # GET /api/v2/hotels
  def index
    @api_v2_hotels = Hotel.all

    render json: @api_v2_hotels
  end

  # GET /api/v2/hotels/1
  def show
    render json: @api_v2_hotel
  end

  # POST /api/v2/hotels
  def create
    @api_v2_hotel = Hotel.new(api_v2_hotel_params)
    @api_v2_hotel.user_id = @current_user.id

    if @api_v2_hotel.save
      render json: @api_v2_hotel, status: :created
    else
      render json: @api_v2_hotel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/hotels/1
  def update
    if @api_v2_hotel.update(api_v2_hotel_params)
      render json: @api_v2_hotel
    else
      render json: @api_v2_hotel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v2/hotels/1
  def destroy
    @api_v2_hotel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v2_hotel
      @api_v2_hotel = Hotel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v2_hotel_params
      params.permit(:name, :location, :email, :phone_number)
    end
end
