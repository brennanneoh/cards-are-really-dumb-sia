FactoryGirl.define do
  factory :card do
    text { Faker::ChuckNorris.unique.fact }
    stack { create :stack }
    card_type { Card::TYPES[:black] }
  end

  factory :black_card, class: Card::Black do
    text { Faker::ChuckNorris.unique.fact }
    stack { create :stack }
    card_type { Card::TYPES[:black] }
    text_type { [ Card::TEXT_TYPES[:question], Card::TEXT_TYPES[:fill_in_the_blanks] ].sample }
    blanks { 1 }
  end

  factory :white_card, class: Card::White do
    text { Faker::TwinPeaks.unique.quote }
    stack { create :stack }
    text_type { Card::TEXT_TYPES[:answer] }
    blanks { 0 }
  end
end
