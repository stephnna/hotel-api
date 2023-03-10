class Api::V4::BookingsController < ApplicationController
  before_action :set_api_v4_booking, only: %i[ show update destroy ]

  # GET /api/v4/bookings
  def index
    @api_v4_bookings = Booking.all

    render json: @api_v4_bookings
  end

  # GET /api/v4/bookings/1
  def show
    render json: @api_v4_booking
  end

  # POST /api/v4/bookings
  def create
    @api_v4_booking = Booking.new(api_v4_booking_params)
    @api_v4_booking.user_id = @current_user.id

    if @api_v4_booking.save
      render json: @api_v4_booking, status: :created
    else
      render json: @api_v4_booking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v4/bookings/1
  def update
    if @api_v4_booking.update(api_v4_booking_params)
      render json: @api_v4_booking
    else
      render json: @api_v4_booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v4/bookings/1
  def destroy
    @api_v4_booking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between action.
    def set_api_v4_booking
      @api_v4_booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v4_booking_params
      params.permit(:days, :booking_date, :amount, :room_id, :hotel_id)
    end
end
