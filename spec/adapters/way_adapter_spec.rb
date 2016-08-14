require 'rails_helper'
require './app/adapters/way_adapter'

RSpec.describe WayAdapter do
  describe '#convert_from_google_json' do
    context 'when json is valid' do
      let(:google_json) do
        JSON.parse(File.new('spec/fixtures/google_directions/200_with_steps.json').read)
      end
      subject(:way) { WayAdapter.convert_from_google_json(google_json) }

      it 'returns distance' do
        expect(way.distance).to eq(99580)
      end

      it 'returns duration' do
        expect(way.duration).to eq(4759)
      end

      it "returns start_waypoint's location" do
        expect(way.start_waypoint.location).to eq('Praça Clóvis Beviláqua, 1 - Sé, São Paulo - SP, 01001-010, Brasil')
      end

      it "returns start_waypoint's latitude" do
        expect(way.start_waypoint.latitude).to eq(-23.5507845)
      end

      it "returns start_waypoint's longitude" do
        expect(way.start_waypoint.longitude).to eq(-46.6338611)
      end

      it "returns end_waypoint's location" do
        expect(way.end_waypoint.location).to eq('Campinas, SP, Brasil')
      end

      it "returns end_waypoint's latitude" do
        expect(way.end_waypoint.latitude).to eq(-22.9099074)
      end

      it "returns end_waypoint's longitude" do
        expect(way.end_waypoint.longitude).to eq(-47.0626259)
      end

      it "has 28 steps" do
        expect(way.steps.length).to eq(28)
      end
    end

    context 'when json is invalid' do
      it 'returns nil given nil json' do
        way = WayAdapter.convert_from_google_json nil
        expect(way).to be_nil
      end

      it 'returns nil given blank json' do
        way = WayAdapter.convert_from_google_json({})
        expect(way).to be_nil
      end
    end
  end
end
