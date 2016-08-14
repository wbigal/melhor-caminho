class TraceRoutesService
  class << self
    def to_default_destination client_id, lat_origin, lng_origin
      create_way(client_id, lat_origin, lng_origin)
    end

    private
      def create_way client_id, lat_origin, lng_origin
        response = get_route(client_id, lat_origin, lng_origin)
        way = WayAdapter.convert_from_google_json(response)
        way.client_id = client_id
        way.save!
        way
      end

      def get_route client_id, lat_origin, lng_origin
        origin = "#{lat_origin},#{lng_origin}"
        destination = Way.default_destination
        GoogleMapsDirectionsApiClient.get origin, destination
      end
  end
end
