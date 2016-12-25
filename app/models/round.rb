class Round < ApplicationRecord
  belongs_to :game
  belongs_to :card_czar, class_name: Player
  belongs_to :black_card, class_name: Card::Black
end
