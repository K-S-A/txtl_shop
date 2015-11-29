RSpec.shared_examples "allowed values for attribute" do |attribute, values|
  values.each do |v|
    it { expect(subject).to allow_value(v).for(attribute) }
  end
end

RSpec.shared_examples "not allowed values for attribute" do |attribute, values|
  values.each do |v|
    it { expect(subject).not_to allow_value(v).for(attribute) }
  end
end
