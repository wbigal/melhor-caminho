class TraceRoutesService
  class << self
    def to_default_destination client_id, lat_origin, lng_origin, query_id = nil
      get_way(client_id, lat_origin, lng_origin, query_id)
    end

    private
      def get_route client_id, lat_origin, lng_origin, query_id = nil
        origin = "#{lat_origin},#{lng_origin}"
        destination = Way.default_destination
        GoogleMapsDirectionsApiClient.get origin, destination
      end

      def get_way client_id, lat_origin, lng_origin, query_id = nil
        response = get_route(client_id, lat_origin, lng_origin, query_id)
        way = WayAdapter.convert_from_google_json(response)
        way.client_id = client_id
        way.save!
        way
      end
  end
end
