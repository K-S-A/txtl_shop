RSpec.describe Group, type: :model do
  subject { FactoryGirl.build(:group) }
#Validate factory
  it 'ensure factory validity' do expect(subject).to be_valid; end
# Associations tests
  it { expect(subject).to have_many(:textiles) }

#Validations tests
  it { expect(subject).to validate_presence_of(:title) }
  it { subject.save; expect(subject).to validate_uniqueness_of(:title).case_insensitive }
  it { expect(subject).to validate_length_of(:title).is_at_least(3) }

end
