require 'rails_helper'
require './app/adapters/waypoint_adapter'

RSpec.describe WaypointAdapter do
  let(:google_json) do
    JSON.parse(File.new('spec/fixtures/google_directions/200_with_steps.json').read)
  end
  let(:node_address) { google_json['routes'].first['legs'].first['start_address'] }
  let(:node_location) { google_json['routes'].first['legs'].first['start_location'] }

  describe '#convert_from_google_json' do
    context 'when json is valid' do
      subject(:waypoint) { WaypointAdapter.convert_from_google_json(node_location, node_address) }

      it "returns location" do
        expect(waypoint.location).to eq('Praça Clóvis Beviláqua, 1 - Sé, São Paulo - SP, 01001-010, Brasil')
      end

      it "returns latitude" do
        expect(waypoint.latitude).to eq(-23.5507845)
      end

      it "returns longitude" do
        expect(waypoint.longitude).to eq(-46.6338611)
      end
    end

    context 'when address is invalid' do
      it 'returns waypoint instance' do
        waypoint = WaypointAdapter.convert_from_google_json(node_location, nil)
        expect(waypoint).to be_an_instance_of(Waypoint)
      end

      it 'returns waypoint instance' do
        waypoint = WaypointAdapter.convert_from_google_json(node_location, {})
        expect(waypoint).to be_an_instance_of(Waypoint)
      end
    end

    context 'when location is invalid' do
      it 'returns nil given nil json' do
        waypoint = WaypointAdapter.convert_from_google_json(nil, node_address)
        expect(waypoint).to be_nil
      end

      it 'returns nil given blank json' do
        waypoint = WaypointAdapter.convert_from_google_json({}, node_address)
        expect(waypoint).to be_nil
      end
    end
  end
end
