json.extract! event, :id, :title, :description
json.start_time event.start_time_formatted_long
json.end_time event.end_time_formatted_long
json.location do
  json.partial! "locations/location", location: event.location
end
