require 'rails_helper'

RSpec.describe Way, type: :model do
  it { should be_kind_of(Waypointable) }
  it { should be_kind_of(Measurable) }

  it_behaves_like 'waypointable'
  it_behaves_like 'measurable'

  context 'fields' do
    it { is_expected.to be_timestamped_document }
    it { is_expected.to have_field(:query_id).of_type(String) }
  end

  context 'indexes' do
    it { is_expected.to have_index_for(query_id: 1).with_options(unique: true, background: true) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:query_id) }
    it { is_expected.to validate_uniqueness_of(:query_id) }
  end

  context 'relations' do
    it { is_expected.to embed_many(:steps) }
  end
end
