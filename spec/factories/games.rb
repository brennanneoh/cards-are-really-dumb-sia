FactoryGirl.define do
  factory :game do
    after(:build) { create :black_card }
    name { Faker::Food.ingredient }
    game_player_ids { create_list(:player, 3).map(&:id) }
    first_card_czar { create :player }
  end
end
