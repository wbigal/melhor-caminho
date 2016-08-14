class StepAdapter
  class << self
    def convert_from_google_json step_json
      return nil if step_json.blank?
      step = Step.new

      step.distance = get_value(step_json['distance']).to_i
      step.duration = get_value(step_json['duration']).to_i
      step.html_instructions = step_json['html_instructions']
      step.maneuver = step_json['maneuver']
      step.start_waypoint = build_waypoint(step_json['start_location'])
      step.end_waypoint = build_waypoint(step_json['end_location'])

      step
    end

    private
      def build_waypoint node_location
        WaypointAdapter.convert_from_google_json node_location
      end

      def get_value node
        node['value']
      end
  end
end
