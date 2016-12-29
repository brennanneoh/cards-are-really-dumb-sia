class Round < ApplicationRecord
  belongs_to :game
  belongs_to :card_czar, class_name: Player
  belongs_to :black_card, class_name: Card::Black

  before_create :pick_black_card
  after_create :assign_hands_to_players

  def pick_black_card
    black_card = Card::Black.pick_one
  end
end
