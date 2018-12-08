require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = locations(:one)
  end

  class ToS < LocationTest
    def test_returns_the_name_of_the_location
      assert_equal @location.name, "#{@location}"
    end
  end
end
