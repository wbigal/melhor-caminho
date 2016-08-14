class TraceRoutesService
  class << self
    def to_default_destination query_id, lat_origin, lng_origin
      origin = '-23.572039,-46.726719'
      destination = Way.default_destination
      response = GoogleMapsDirectionsApiClient.get origin, destination
      way = convert_from_google_json google_json
    end

    private
      def convert_from_google_json google_json
        return nil if google_json.blank?
        nil
      end
  end
end
