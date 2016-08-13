class Step
  include Mongoid::Document
  include Waypointable
  include Measurable

  embedded_in :way

  field :html_instructions, type: String
end
