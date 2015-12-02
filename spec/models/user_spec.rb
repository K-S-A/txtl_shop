require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.build(:user) }

#Validate factory
  it 'ensure factory validity' do expect(subject).to be_valid; end
  context 'Association' do

  end

  context 'Validation' do

  end

  pending "add some examples to (or delete) #{__FILE__}"
end
