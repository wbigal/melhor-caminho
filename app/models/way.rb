class Way
  include Mongoid::Document
  include Mongoid::Timestamps
  include Waypointable
  include Measurable

  embeds_many :steps

  field :query_id, type: String

  validates :query_id, presence: true, uniqueness: true

  index({ query_id: 1 }, { unique: true, background: true })
end
