class EventsController < ApplicationController
  before_action :set_event, only: :show

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/1
  def show
  end

  private

  def set_event
    @event = Event.find(params[:id])
    @location = @event.location
  end
end
