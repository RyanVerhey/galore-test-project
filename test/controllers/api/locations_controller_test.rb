require 'test_helper'

class Api::LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get api_locations_url format: :json
    assert_response :success
  end

  test "should show location" do
    get api_location_url @location, format: :json
    assert_response :success
  end

  test "returns 404 when location not found" do
    get api_location_url("ABC", format: :json)
    assert_response :not_found
  end
end
