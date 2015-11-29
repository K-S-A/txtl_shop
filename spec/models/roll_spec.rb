RSpec.describe Roll, type: :model do
  subject { FactoryGirl.build(:roll) }

#Validate factory
  it 'ensure factory validity' do expect(subject).to be_valid; end
  context 'Association' do
    it { expect(subject).to belong_to(:textile) }
  end
  context 'Validation' do
    include_examples "allowed values for attribute", :suffix, %w(3 g)
    include_examples "not allowed values for attribute", :suffix, %w(\  / G)
    it { expect(subject).to validate_presence_of(:suffix) }
    it { expect(subject).to validate_length_of(:suffix).is_equal_to(1) }
    it { subject.save; expect(subject).to validate_uniqueness_of(:suffix).
      scoped_to(:textile_id) }

    it { expect(subject).to validate_presence_of(:location) }
    it { expect(subject).to validate_length_of(:location).is_at_least(3) }

    it { expect(subject).to validate_presence_of(:textile) }
    it { subject.textile.code = nil; expect(subject).not_to be_valid }
  end
end
