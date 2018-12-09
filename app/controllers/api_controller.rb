class ApiController < ApplicationController
  before_action :ensure_json_request

  def ensure_json_request
    return true if request.format == :json
    head 406, content_type: 'text/html'
  end

  def render_error(status, message)
    error_json = {
      error: {
        code: status,
        message: message
      }
    }

    render json: error_json, status: status
  end
end
