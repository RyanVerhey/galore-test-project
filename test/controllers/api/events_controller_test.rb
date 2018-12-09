require 'test_helper'

class Api::EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get api_events_url format: :json
    assert_response :success
  end

  test "should show event" do
    get api_event_url @event, format: :json
    assert_response :success
  end

  test "returns 404 when event not found" do
    get api_event_url("ABC", format: :json)
    assert_response :not_found
  end
end
