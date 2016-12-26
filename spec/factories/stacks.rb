FactoryGirl.define do
  factory :stack do
    name { Faker::Book.title }
  end
end
