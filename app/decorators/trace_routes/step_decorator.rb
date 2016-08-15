class TraceRoutes::StepDecorator
  def self.for(step)
    new(step)
  end

  attr_reader :step

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
end
