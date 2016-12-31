FactoryGirl.define do
  factory :card do
    card_type { Card::TYPES.values.sample }
    text { Faker::ChuckNorris.unique.fact }
    stack { create :stack }

    after(:build) do |card|
      case card.card_type
      when Card::TYPES[:black]
        card.text_type = Card::Black::TEXT_TYPES.sample
        card.blanks = 1
      when Card::TYPES[:white]
        card.text_type = Card::TEXT_TYPES[:answer]
      end
    end
  end

  factory :black_card, parent: :card, class: Card::Black do
    card_type { Card::TYPES[:black] }
    text_type { [ Card::TEXT_TYPES[:question], Card::TEXT_TYPES[:fill_in_the_blanks] ].sample }
    blanks { 1 }
  end

  factory :question_card, parent: :black_card do
    text_type { Card::TEXT_TYPES[:question] }
  end

  factory :fill_in_the_blanks_card, parent: :black_card do
    text_type { Card::TEXT_TYPES[:fill_in_the_blanks] }
  end

  factory :white_card, parent: :card, class: Card::White do
    card_type { Card::TYPES[:white] }
    text { Faker::TwinPeaks.unique.quote }
    text_type { Card::TEXT_TYPES[:answer] }
  end
end
