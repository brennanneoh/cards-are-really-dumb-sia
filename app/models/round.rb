class Round < ApplicationRecord
  belongs_to :game
  belongs_to :card_czar, class_name: Player
  belongs_to :black_card, class_name: Card::Black

  has_many :hands

  before_create :pick_black_card
  after_create :assign_hands_to_players

  private

  def pick_black_card
    self.black_card = Card::Black.pick_one
  end

  def assign_hands_to_players
    game.players.each do |player|
      Hand.new round: self, player: player, white_card: Card::White.pick_one
    end
  end
end
