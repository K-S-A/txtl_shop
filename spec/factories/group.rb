FactoryGirl.define do

  factory :group do
    title { Faker::Name.title }
    description { Faker::Lorem.paragraph }
  end

end
