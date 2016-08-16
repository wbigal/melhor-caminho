require 'rails_helper'
require './app/decorators/trace_routes/way_decorator'

RSpec.describe TraceRoutes::WayDecorator do
  let(:way) do
    way = Way.new(attributes_for(:way))
    way.start_waypoint = build(:waypoint)
    way.end_waypoint = build(:waypoint_end)
    way.steps.build(attributes_for(:step))
    step = way.steps.first
    step.start_waypoint = build(:waypoint)
    step.end_waypoint = build(:waypoint_end)
    way
  end

  subject(:way_decorator) { TraceRoutes::WayDecorator.for(way) }

  it { expect(way_decorator.distance).to eq('21 metros') }
  it { expect(way_decorator.duration).to eq('1 minuto') }
  it { expect(way_decorator.start_location).to eq([-23.5507845,-46.6338611]) }
  it { expect(way_decorator.end_location).to eq([-43.5507845,-26.6338611]) }
  it { expect(way_decorator.steps.length).to eq(way.steps.length) }
end
