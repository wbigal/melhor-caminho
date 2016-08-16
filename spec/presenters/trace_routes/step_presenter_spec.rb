require 'rails_helper'
require './app/presenters/trace_routes/step_presenter'

RSpec.describe TraceRoutes::StepPresenter do
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

  subject(:step_presenter) { TraceRoutes::StepPresenter.for(step) }

  it { expect(step_presenter.distance).to eq('34 metros') }
  it { expect(step_presenter.duration).to eq('1 minuto') }
  it { expect(step_presenter.html_instructions).to eq(step.html_instructions) }
  it { expect(step_presenter.start_location).to eq([-23.5507845,-46.6338611]) }
  it { expect(step_presenter.end_location).to eq([-43.5507845,-26.6338611]) }
end
