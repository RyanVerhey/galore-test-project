require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = events(:one)
  end

  class FormattedStartAndEndTimes < EventTest
    def setup
      super
      @event.start_time = DateTime.parse "2018/12/8 12:00:00 +0000"
      @event.end_time = DateTime.parse "2018/12/10 9:00:00 +0000"
    end

    test "start_time_formatted returns a compacted formatted start time" do
      formatted = @event.start_time_formatted
      assert_equal "12/8/2018 @ 12:00 PM +0000", formatted
    end

    test "start_time_formatted_long returns a long-form formatted start time" do
      formatted = @event.start_time_formatted_long
      assert_equal "Saturday, December 8, 2018 at 12:00 PM +0000", formatted
    end

    test "end_time_formatted returns a compacted formatted end time" do
      formatted = @event.end_time_formatted
      assert_equal "12/10/2018 @ 9:00 AM +0000", formatted
    end

    test "end_time_formatted_long returns a long-form formatted end time" do
      formatted = @event.end_time_formatted_long
      assert_equal "Monday, December 10, 2018 at 9:00 AM +0000", formatted
    end
  end
end
