require 'rails_helper'

RSpec.describe Way, type: :model do
  it { should be_kind_of(Measurable) }
  it_behaves_like 'measurable'

  context 'fields' do
    it { is_expected.to be_timestamped_document }
    it { is_expected.to have_field(:client_id).of_type(String) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:client_id) }
    it { is_expected.to validate_presence_of(:start_waypoint) }
    it { is_expected.to validate_presence_of(:end_waypoint) }
  end

  context 'relations' do
    it { is_expected.to embed_many(:steps) }
    it { is_expected.to embed_one(:start_waypoint) }
    it { is_expected.to embed_one(:end_waypoint) }
  end

  context 'indexes' do
    it { is_expected.to have_index_for(client_id: 1) }
  end

  describe '#default_destination' do
    it 'returns default destination concatenated' do
      expect(Way.default_destination).to eq('-23.594908,-46.686052')
    end
  end
end
