class Ajax::EventsController < AjaxController
  before_action :set_event, only: :show

  # GET /ajax/events/1.json
  def show
  end

  private

  def set_event
    # So the event is nil when not found
    @event = Event.where(id: params[:id]).first
    @location = @event.location if @event
  end
end
