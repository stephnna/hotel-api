class Api::V3::RoomsController < ApplicationController
  before_action :set_api_v3_room, only: %i[ show update destroy ]

  # GET /api/v3/rooms
  def index
    @api_v3_rooms = Room.all

    render json: @api_v3_rooms
  end

  # GET /api/v3/rooms/1
  def show
    render json: @api_v3_room
  end

  # POST /api/v3/rooms
  def create
    @api_v3_room = Room.new(api_v3_room_params)

    if @api_v3_room.save
      render json: @api_v3_room, status: :created
    else
      render json: @api_v3_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v3/rooms/1
  def update
    if @api_v3_room.update(api_v3_room_params)
      render json: @api_v3_room
    else
      render json: @api_v3_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v3/rooms/1
  def destroy
    @api_v3_room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v3_room
      @api_v3_room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v3_room_params
      params.permit(:room_type, :bed_count, :price, :reserved, :room_number, :hotel_id)
    end
end
