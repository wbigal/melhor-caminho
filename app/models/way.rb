class Way
  include Mongoid::Document
  include Mongoid::Timestamps
  include Measurable

  embeds_many :steps
  embeds_one :start_waypoint, as: :waypointable, class_name: Waypoint
  embeds_one :end_waypoint, as: :waypointable, class_name: Waypoint

  field :client_id, type: String

  validates :client_id, presence: true
  validates :start_waypoint, presence: true
  validates :end_waypoint, presence: true

  def self.default_destination
    "#{ENV['LATITUDE_DEFAULT_DESTINATION']},#{ENV['LONGITUDE_DEFAULT_DESTINATION']}"
  end
end
