FactoryGirl.define do
  factory :hand do
    round { create :round }
    player { create :player }
    white_card { create(:white_card) }
  end
end
