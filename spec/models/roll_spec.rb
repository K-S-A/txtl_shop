RSpec.describe Roll, type: :model do
  subject { FactoryGirl.build(:roll) }

#Validate factory
  it 'ensure factory validity' do expect(subject).to be_valid; end
  context 'Association' do
    it { expect(subject).to belong_to(:textile) }
  end
  context 'Validation' do
    it { expect(subject).to validate_presence_of(:suffix) }
    it { expect(subject).to validate_length_of(:suffix).is_equal_to(1) }
    it { expect(subject).to allow_value('g').for(:suffix) }
    it { expect(subject).to allow_value('3').for(:suffix) }
    it { expect(subject).not_to allow_value('G').for(:suffix) }
    it { expect(subject).not_to allow_value('/').for(:suffix) }
    it { subject.save; expect(subject).to validate_uniqueness_of(:suffix).
      scoped_to(:textile_id) }

    it { expect(subject).to validate_presence_of(:location) }
    it { expect(subject).to validate_length_of(:location).is_at_least(3) }

    it { expect(subject).to validate_presence_of(:textile) }
    it { subject.textile.code = nil; expect(subject).not_to be_valid }
  end
end
