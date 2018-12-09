class ApiController < ApplicationController
  before_action :ensure_json_request

  def ensure_json_request
    return true if request.format == :json
    head 406, content_type: 'text/html'
  end
end
