class Way
  include Mongoid::Document
  include Mongoid::Timestamps
  include Measurable

  embeds_many :steps
  embeds_one :start_waypoint, as: :waypointable
  embeds_one :end_waypoint, as: :waypointable

  field :client_id, type: String

  validates :client_id, presence: true
  validates :start_waypoint, presence: true
  validates :end_waypoint, presence: true
end
