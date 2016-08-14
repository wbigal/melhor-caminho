require 'rails_helper'
require './app/adapters/step_adapter'

RSpec.describe StepAdapter do
  describe '#convert_from_google_json' do
    context 'when json is valid' do
      let(:google_json) do
        JSON.parse(File.new('spec/fixtures/google_directions/200_with_steps.json').read)
      end
      let(:steps) { google_json['routes'].first['legs'].first['steps'] }
      subject(:step) { StepAdapter.convert_from_google_json(steps[1]) }

      it 'returns distance' do
        expect(step.distance).to eq(34)
      end

      it 'returns duration' do
        expect(step.duration).to eq(34)
      end

      it 'returns html_instructions' do
        expect(step.html_instructions).to eq('Vire à <b>esquerda</b> na <b>Praça da Sé</b>')
      end

      it 'returns maneuver' do
        expect(step.maneuver).to eq('turn-left')
      end

      it "returns start_waypoint's latitude" do
        expect(step.start_waypoint.latitude).to eq(-23.5505617)
      end

      it "returns start_waypoint's longitude" do
        expect(step.start_waypoint.longitude).to eq(-46.6343409)
      end

      it "returns end_waypoint's latitude" do
        expect(step.end_waypoint.latitude).to eq(-23.5508315)
      end

      it "returns end_waypoint's longitude" do
        expect(step.end_waypoint.longitude).to eq(-46.6344954)
      end
    end

    context 'when json is invalid' do
      it 'returns nil given nil json' do
        step = StepAdapter.convert_from_google_json nil
        expect(step).to be_nil
      end

      it 'returns nil given blank json' do
        step = StepAdapter.convert_from_google_json({})
        expect(step).to be_nil
      end
    end
  end
end
