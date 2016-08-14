class Waypoint
  include Mongoid::Document

  field :location, type: String
  field :latitude, type: Float
  field :longitude, type: Float

  embedded_in :waypointable, polymorphic: true

  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
end
