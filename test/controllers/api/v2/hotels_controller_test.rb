require "test_helper"

class Api::V2::HotelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v2_hotel = api_v2_hotels(:one)
  end

  test "should get index" do
    get api_v2_hotels_url, as: :json
    assert_response :success
  end

  test "should create api_v2_hotel" do
    assert_difference("Api::V2::Hotel.count") do
      post api_v2_hotels_url, params: { api_v2_hotel: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v2_hotel" do
    get api_v2_hotel_url(@api_v2_hotel), as: :json
    assert_response :success
  end

  test "should update api_v2_hotel" do
    patch api_v2_hotel_url(@api_v2_hotel), params: { api_v2_hotel: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v2_hotel" do
    assert_difference("Api::V2::Hotel.count", -1) do
      delete api_v2_hotel_url(@api_v2_hotel), as: :json
    end

    assert_response :no_content
  end
end
