require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  class EnsureJsonRequest < ApiControllerTest
    test "returns a 406 if the request isn't JSON"
  end

  class RenderError < ApiControllerTest
    test "returns a properly formatted JSON error"
  end
end
