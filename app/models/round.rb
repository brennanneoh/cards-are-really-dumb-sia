class Round < ApplicationRecord
  ROUND_LIMIT_PER_GAME = 10

  belongs_to :game
  belongs_to :card_czar, class_name: Player
  belongs_to :black_card, class_name: Card::Black

  has_many :hands

  validate :ensure_within_round_limit

  after_create :assign_hands_to_players

  private

  def ensure_within_round_limit
    errors.add(:game, "has reached the round limit") if game.rounds.count == ROUND_LIMIT_PER_GAME
  end

  def assign_hands_to_players
    game.players.each do |player|
      Hand.new round: self, player: player, white_card: Card::White.pick_one
    end
  end
end
