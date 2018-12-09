require 'test_helper'

class TestApiController < ApiController
  def show
    render text: "foo"
  end

  def error_403
    render_error 403, "Unauthorized"
  end

  def error_400
    render_error 400, "Bad Request"
  end

  def error_451
    render_error 451, "Unavailable for legal reasons"
  end
end

class ApiControllerTest < ActionDispatch::IntegrationTest
  def setup
    Rails.application.routes.draw do
      get '/foo' => "test_api#show"
      get '/error_403' => "test_api#error_403"
      get '/error_400' => "test_api#error_400"
      get '/error_451' => "test_api#error_451"
    end
  end

  def teardown
    # reloading routes after tests because #setup completely overwrites them
    Rails.application.reload_routes!
  end

  class EnsureJsonRequest < ApiControllerTest
    test "returns a 406 if the request isn't JSON" do
      get '/foo'
      assert_response 406
    end
  end

  class RenderError < ApiControllerTest
    def generate_expected_error_json(status, message)
      {
        "error" => {
          "code" => status,
          "message" => message
        }
      }
    end

    def get_json_response(response)
      JSON.parse response.body
    end

    test "returns a properly formatted JSON error" do
      get '/error_403.json'
      assert_response 403
      body = get_json_response response
      expected = generate_expected_error_json 403, "Unauthorized"
      assert_equal expected, body

      get '/error_400.json'
      assert_response 400
      body = get_json_response response
      expected = generate_expected_error_json 400, "Bad Request"
      assert_equal expected, body

      get '/error_451.json'
      assert_response 451
      body = get_json_response response
      expected = generate_expected_error_json 451, "Unavailable for legal reasons"
      assert_equal expected, body
    end
  end
end
