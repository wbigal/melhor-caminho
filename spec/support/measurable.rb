shared_examples_for 'measurable' do
  context 'fields' do
    it { is_expected.to have_field(:distance).of_type(Integer) }
    it { is_expected.to have_field(:duration).of_type(Integer) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:distance) }
    it { is_expected.to validate_numericality_of(:distance).greater_than(0) }
    it { is_expected.to validate_presence_of(:duration) }
    it { is_expected.to validate_numericality_of(:duration).greater_than(0) }
  end
end
