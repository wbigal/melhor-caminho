shared_examples_for 'waypointable' do
  context 'fields' do
    it { is_expected.to have_field(:location).of_type(String) }
    it { is_expected.to have_field(:latitude).of_type(Float) }
    it { is_expected.to have_field(:longitude).of_type(Float) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
  end
end
