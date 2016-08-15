class TraceRoutes::WayDecorator
  def self.for(way)
    new(way)
  end

  def initialize(way)
    @way = way
  end

  def distance
    @way.distance
  end

  def duration
    @way.duration
  end

  def start_location
    [ @way.start_waypoint.latitude, @way.start_waypoint.longitude ]
  end

  def end_location
    [ @way.end_waypoint.latitude, @way.end_waypoint.longitude ]
  end

  def steps
    decorated_steps = []

    @way.steps.each do |step|
      decorated_steps << TraceRoutes::StepDecorator.for(step)
    end

    decorated_steps
  end

  def as_json options = nil
    {
      distance: self.distance,
      duration: self.duration,
      start_location: self.start_location,
      end_location: self.end_location,
      steps: steps.map(&:as_json)
    }
  end

  private
    attr_reader :way
end
