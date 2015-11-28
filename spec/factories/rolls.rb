FactoryGirl.define do
  factory :roll do
    suffix { ('a'..'z').to_a.sample }
    location { Faker::Number.number(3) }
    comment { Faker::Lorem.paragraph }
    textile
  end

end
