json.extract! event, :id, :title, :description, :start_time, :end_time
json.url api_event_url(event, format: :json)
json.location do
  json.partial! "api/locations/location", location: event.location, simple: true
end
