class TraceRoutes::StepDecorator
  def self.for(step)
    new(step)
  end

  def initialize(step)
    @step = step
  end

  def distance
    @step.distance
  end

  def duration
    @step.duration
  end

  def html_instructions
    @step.html_instructions
  end

  def maneuver
    @step.maneuver
  end

  def start_location
    [ @step.start_waypoint.latitude, @step.start_waypoint.longitude ]
  end

  def end_location
    [ @step.end_waypoint.latitude, @step.end_waypoint.longitude ]
  end

  def as_json options = nil
    {
      distance: self.distance,
      duration: self.duration,
      start_location: self.start_location,
      end_location: self.end_location,
      html_instructions: self.html_instructions,
      maneuver: self.maneuver
    }
  end

  private
    attr_reader :step
end
