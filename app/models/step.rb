class Step
  include Mongoid::Document
  include Measurable

  embedded_in :way
  embeds_one :start_waypoint, as: :waypointable, class_name: Waypoint
  embeds_one :end_waypoint, as: :waypointable, class_name: Waypoint

  field :html_instructions, type: String
  field :maneuver, type: String

  validates :way, presence: true
  validates :start_waypoint, presence: true
  validates :end_waypoint, presence: true
end
