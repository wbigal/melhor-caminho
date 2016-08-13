module Waypointable
  extend ActiveSupport::Concern

  included do
    field :location, type: String
    field :latitude, type: Float
    field :longitude, type: Float

    validates :location, presence: true, uniqueness: true
    validates :latitude, presence: true, numericality: true
    validates :longitude, presence: true, numericality: true
  end
end
