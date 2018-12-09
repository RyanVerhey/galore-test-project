require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = locations(:one)
  end

  class ToS < LocationTest
    test "returns the name of the location" do
      assert_equal @location.name, "#{@location}"
    end
  end
end
