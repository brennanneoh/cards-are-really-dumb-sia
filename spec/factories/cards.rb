FactoryGirl.define do
  factory :card do
    text { Faker::ChuckNorris.unique.fact }
    stack { create :stack }
    card_type { Card::TYPES[:black] }

    trait :black do
      text_type { [ Card::TEXT_TYPES[:question], Card::TEXT_TYPES[:fill_in_the_blanks] ].sample }
      blanks { 1 }
    end

  end
end
