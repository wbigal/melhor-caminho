require 'rails_helper'

RSpec.describe Step, type: :model do
  it { should be_kind_of(Waypointable) }
  it { should be_kind_of(Measurable) }

  it_behaves_like 'waypointable'
  it_behaves_like 'measurable'

  context 'fields' do
    it { is_expected.to have_field(:html_instructions).of_type(String) }
  end


  context 'relations' do
    it { is_expected.to be_embedded_in(:way) }
  end
end
