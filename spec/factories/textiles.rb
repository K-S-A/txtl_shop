FactoryGirl.define do
  factory :textile do
    code { Faker::Lorem.characters(rand(3..10)) }
    name { Faker::Commerce.product_name[0..11] }
    country { Faker::Address.country_code }
    manufacturer { Faker::Company.name }
    man_code { Faker::Code.isbn }
    units { ["m", "pcs"].sample }
    height { Faker::Number.between(1, 499) }
    price { Faker::Number.between(1, 99999) }
    group
  end
end
