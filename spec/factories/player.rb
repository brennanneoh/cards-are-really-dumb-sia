FactoryGirl.define do
  factory :player do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
  end
end
