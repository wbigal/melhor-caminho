class TraceRoutesService
  class << self
    def to_default_destination client_id, lat_origin, lng_origin
      origin = "#{lat_origin},#{lng_origin}"
      destination = Way.default_destination
      response = GoogleMapsDirectionsApiClient.get origin, destination
      way = WayAdapter.convert_from_google_json(response)
      way.client_id = client_id
      way.save!
      way
    end
  end
end
