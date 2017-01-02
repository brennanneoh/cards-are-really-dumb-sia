class Hand < ApplicationRecord
  self.primary_keys = :round_id, :player_id

  HAND_LIMIT_PER_PLAYER = 10

  belongs_to :round
  belongs_to :player
  belongs_to :white_card, class_name: Card::White

  validate :ensure_within_hand_limit

  def self.current_for round_id, player_id
    joins(:white_card).where round_id: round_id, player_id: player_id
  end

  private

  def ensure_within_hand_limit
    errors.add(:player, "has reached the maximum number of hands")  if player.hands.where(round: round).count == HAND_LIMIT_PER_PLAYER
  end

end
