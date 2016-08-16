require 'rails_helper'
require './app/presenters/trace_routes/way_presenter'

RSpec.describe TraceRoutes::WayPresenter do
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

  subject(:way_presenter) { TraceRoutes::WayPresenter.for(way) }

  it { expect(way_presenter.start_address).to eq(way.start_waypoint.location) }
  it { expect(way_presenter.end_address).to eq(way.start_waypoint.location) }
  it { expect(way_presenter.distance).to eq('21 metros') }
  it { expect(way_presenter.duration).to eq('1 minuto') }
  it { expect(way_presenter.start_location).to eq([-23.5507845,-46.6338611]) }
  it { expect(way_presenter.end_location).to eq([-43.5507845,-26.6338611]) }
  it { expect(way_presenter.steps.length).to eq(way.steps.length) }
end
