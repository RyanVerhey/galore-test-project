require 'test_helper'

class Ajax::EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end
end
