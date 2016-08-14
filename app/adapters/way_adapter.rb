class WayAdapter
  class << self
    def convert_from_google_json google_json
      return nil if google_json.blank?
      way = Way.new

      route = get_route(google_json)
      leg = get_leg(route)
      steps = get_steps(leg)

      way.distance = get_value(leg['distance']).to_i
      way.duration = get_value(leg['duration']).to_i
      way.start_waypoint = build_waypoint(leg['start_location'], leg['start_address'])
      way.end_waypoint = build_waypoint(leg['end_location'], leg['end_address'])

      steps.each do |step|
        way.steps.append(build_step(step))
      end

      way
    end

    private
      def build_step step
        Step.new(
          html_instructions: step['html_instructions']
        )
      end

      def build_waypoint node_location, node_address
        WaypointAdapter.convert_from_google_json node_location, node_address
      end

      def get_route google_json
        google_json['routes'].first
      end

      def get_leg route
        route['legs'].first
      end

      def get_steps leg
        leg['steps']
      end

      def get_value node
        node['value']
      end
  end
end
