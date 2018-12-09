json.extract! event, :id, :title, :description, :start_time, :end_time
json.location do
  json.partial! "locations/location", location: event.location
end
