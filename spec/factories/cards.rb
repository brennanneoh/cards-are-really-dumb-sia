FactoryGirl.define do
  factory :card do
    text { Faker::ChuckNorris.unique.fact }
    stack { create :stack }
  end

  factory :black_card, parent: :card, class: Card::Black do
    card_type { Card::TYPES[:black] }
    text_type { [ Card::TEXT_TYPES[:question], Card::TEXT_TYPES[:fill_in_the_blanks] ].sample }
    blanks { 1 }
  end

  factory :white_card, parent: :card, class: Card::White do
    text { Faker::TwinPeaks.unique.quote }
    text_type { Card::TEXT_TYPES[:answer] }
  end
end
