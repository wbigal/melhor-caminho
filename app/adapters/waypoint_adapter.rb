class WaypointAdapter
  class << self
    def convert_from_google_json node_location, node_address = nil
      return nil if node_location.blank?
      Waypoint.new(
        location: node_address,
        latitude: node_location['lat'].to_f,
        longitude: node_location['lng'].to_f
        )
    end
  end
end
