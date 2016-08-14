require 'rails_helper'

RSpec.describe Step, type: :model do
  it { should be_kind_of(Measurable) }
  it_behaves_like 'measurable'

  context 'fields' do
    it { is_expected.to have_field(:html_instructions).of_type(String) }
    it { is_expected.to have_field(:maneuver).of_type(String) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:way) }
    it { is_expected.to validate_presence_of(:start_waypoint) }
    it { is_expected.to validate_presence_of(:end_waypoint) }
  end

  context 'relations' do
    it { is_expected.to be_embedded_in(:way) }
    it { is_expected.to embed_one(:start_waypoint) }
    it { is_expected.to embed_one(:end_waypoint) }
  end
end
