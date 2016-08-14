require 'rails_helper'
require './app/clients/google_maps_directions_api_client'

RSpec.describe GoogleMapsDirectionsApiClient do
  describe '#get' do
    context 'when api return success' do
      let(:origin) { '-23.5507845,-46.6338611' }
      let(:destionation) { '-22.908365,-46.6284125' }
      subject(:response) { GoogleMapsDirectionsApiClient.get origin, destionation }

      it 'response status is OK' do
        expect(response['status']).to eq('OK')
      end
    end

    context 'when blank lat or lng' do
      let(:origin) { '' }
      let(:destionation) { '' }

      it 'raise InvalidRequest' do
        expect {
          GoogleMapsDirectionsApiClient.get(origin, destionation)
        }.to raise_error(GoogleMapsDirectionsApiClient::InvalidRequest)
      end
    end

    context 'when api return not found' do
      let(:origin) { '1,1' }
      let(:destionation) { '1,1' }

      it 'raise NotFound' do
        expect {
          GoogleMapsDirectionsApiClient.get(origin, destionation)
        }.to raise_error(GoogleMapsDirectionsApiClient::NotFound)
      end
    end
  end

end
