require "test_helper"

class Api::V3::RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v3_room = api_v3_rooms(:one)
  end

  test "should get index" do
    get api_v3_rooms_url, as: :json
    assert_response :success
  end

  test "should create api_v3_room" do
    assert_difference("Api::V3::Room.count") do
      post api_v3_rooms_url, params: { api_v3_room: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v3_room" do
    get api_v3_room_url(@api_v3_room), as: :json
    assert_response :success
  end

  test "should update api_v3_room" do
    patch api_v3_room_url(@api_v3_room), params: { api_v3_room: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v3_room" do
    assert_difference("Api::V3::Room.count", -1) do
      delete api_v3_room_url(@api_v3_room), as: :json
    end

    assert_response :no_content
  end
end
