class Api::LocationsController < ApiController
  before_action :set_location, only: :show

  # GET /api/locations.json
  def index
    @locations = Location.all
  end

  # GET /api/locations/1.json
  def show
    render_error 404, "Location with ID #{ params[:id] } not found" if @location.nil?
  end

  private

  def set_location
    # So the location is nil when not found
    @location = Location.where(id: params[:id]).first
  end
end
