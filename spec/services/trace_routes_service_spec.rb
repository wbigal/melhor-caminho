require 'rails_helper'
require './app/services/trace_routes_service'

RSpec.describe TraceRoutesService do
  describe '#to_default_destination' do
    context 'when exists route' do
      it 'creates new way' do
        expect {
          TraceRoutesService.to_default_destination '12345', -23.5507845, -46.6338611
        }.to change(Way, :count).by(1)
      end
    end
  end
end
