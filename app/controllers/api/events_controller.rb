class Api::EventsController < ApiController
  before_action :set_event, only: :show

  # GET /api/events.json
  def index
    @events = Event.all
  end

  # GET /api/events/1.json
  def show
    render_error 404, "Event with ID #{ params[:id] } not found" if @event.nil?
  end

  private

  def set_event
    begin
      @event = Event.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      # Event is nil
    end
  end
end
