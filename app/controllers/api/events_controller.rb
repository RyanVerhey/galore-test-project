class Api::EventsController < ApiController
  before_action :set_event, only: :show

  # GET /api/events.json
  def index
    @events = Event.all
  end

  # GET /api/events/1.json
  def show
  end

  private

  def set_event
    @event = Event.find(params[:id])
    @location = @event.location
  end
end
