FactoryGirl.define do
  factory :round do
    game { create :game }
    card_czar { create :player }
    black_card { create :black_card }
  end
end
