require 'rails_helper'
require './app/decorators/trace_routes/step_decorator'

RSpec.describe TraceRoutes::StepDecorator do
  let(:way) do
    way = Way.new(attributes_for(:way))
    way.steps.build(attributes_for(:step))
    way
  end
  let(:step) do
    step = way.steps.first
    step.start_waypoint = build(:waypoint)
    step.end_waypoint = build(:waypoint_end)
    step
  end

  subject(:step_decorator) { TraceRoutes::StepDecorator.for(step) }

  it { expect(step_decorator.distance).to eq(step.distance) }
  it { expect(step_decorator.duration).to eq(step.duration) }
  it { expect(step_decorator.html_instructions).to eq(step.html_instructions) }
  it { expect(step_decorator.start_location).to eq([-23.5507845,-46.6338611]) }
  it { expect(step_decorator.end_location).to eq([-43.5507845,-26.6338611]) }
end
