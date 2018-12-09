simple ||= false

if simple
  json.id location.id
else
  json.extract! location, :id, :name, :address_line_1, :address_line_2, :city, :district, :post_code, :latitude, :longitude
end
json.url api_location_url(location, format: :json)
