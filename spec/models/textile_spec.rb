RSpec.describe Textile, type: :model do
  subject { FactoryGirl.build(:textile) }

#Validate factory
  it 'ensure factory validity' do expect(subject).to be_valid; end
  context 'Association' do
    it { expect(subject).to belong_to(:group) }
    it { expect(subject).to have_many(:rolls).dependent(:destroy) }
  end
  context 'Validation' do
    it { expect(subject).to validate_presence_of(:code) }
    it { subject.save; expect(subject).to validate_uniqueness_of(:code) }
    it { expect(subject).to validate_length_of(:code).
      is_at_least(3).
      is_at_most(10) }
    include_examples "allowed values for attribute", :code, %w(p150578)
    include_examples "not allowed values for attribute", :code, %w(P150578, p_150578)

    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_length_of(:name).
      is_at_least(3).
      is_at_most(200) }
    it { expect(subject).not_to allow_value("some_name").for(:name) }
    it { expect(subject).to allow_value("Some_name").for(:name) }

    it { expect(subject).to validate_length_of(:country).is_equal_to(2) }
    include_examples "allowed values for attribute", :country, [nil, 'TR']
    include_examples "not allowed values for attribute", :country, %w(tr tR Tr)

    it { expect(subject).to validate_presence_of(:units) }
    it { expect(subject).to validate_inclusion_of(:units).in_array(%w(m pcs)) }

    it { expect(subject).to validate_presence_of(:height) }
    it { expect(subject).to validate_numericality_of(:height).
      is_less_than(500).
      is_greater_than(0).
      only_integer }

    it { expect(subject).to validate_presence_of(:price) }
    it { expect(subject).to validate_numericality_of(:price).
      is_greater_than(0).
      only_integer }

    it { expect(subject).to validate_presence_of(:group) }
    it { subject.group.title = nil; expect(subject).not_to be_valid }
  end
end
