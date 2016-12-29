FactoryGirl.define do
  factory :round do
    game { create :game }
    card_czar { create :player }
  end
end
