require "test_helper"

class Api::V4::BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v4_booking = api_v4_bookings(:one)
  end

  test "should get index" do
    get api_v4_bookings_url, as: :json
    assert_response :success
  end

  test "should create api_v4_booking" do
    assert_difference("Api::V4::Booking.count") do
      post api_v4_bookings_url, params: { api_v4_booking: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v4_booking" do
    get api_v4_booking_url(@api_v4_booking), as: :json
    assert_response :success
  end

  test "should update api_v4_booking" do
    patch api_v4_booking_url(@api_v4_booking), params: { api_v4_booking: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v4_booking" do
    assert_difference("Api::V4::Booking.count", -1) do
      delete api_v4_booking_url(@api_v4_booking), as: :json
    end

    assert_response :no_content
  end
end
