require 'test_helper'

class DateTimeFormatterTest < ActiveSupport::TestCase
  class DateTimeFormat < DateTimeFormatterTest
    test "returns the format of the date" do
      # Compact
      assert_equal "%-m/%-d/%Y @ %-l:%M %p %z", DateTimeFormatter.date_time_format(compact: true)

      # Non-compact
      assert_equal "%A, %B %-d, %Y at %-l:%M %p %z", DateTimeFormatter.date_time_format(compact: false)
    end

    test "defaults to non-compact" do
      assert_equal "%A, %B %-d, %Y at %-l:%M %p %z", DateTimeFormatter.date_time_format
    end
  end

  class FormatDateTime < DateTimeFormatterTest
    def setup
      super
      @date_time = DateTime.parse "2018/12/8 12:00:00 +0000"
    end

    test "formats the given DateTime" do
      # Compact
      formatted = DateTimeFormatter.format_date_time @date_time, compact: true
      assert_equal "12/8/2018 @ 12:00 PM +0000", formatted

      # Non-compact
      formatted = DateTimeFormatter.format_date_time @date_time, compact: false
      assert_equal "Saturday, December 8, 2018 at 12:00 PM +0000", formatted
    end

    test "defauts to non-compact" do
      formatted = DateTimeFormatter.format_date_time @date_time
      assert_equal "Saturday, December 8, 2018 at 12:00 PM +0000", formatted
    end

    test "returns nil if passed nil" do
      assert_nil DateTimeFormatter.format_date_time nil
    end
  end
end
