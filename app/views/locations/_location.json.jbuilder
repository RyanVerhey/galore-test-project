json.extract! location, :id, :name, :address_line_1, :address_line_2, :city, :district, :post_code, :latitude, :longitude, :created_at, :updated_at
json.url location_url(location, format: :json)
