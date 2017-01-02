class Hand < ApplicationRecord
  HAND_LIMIT_PER_PLAYER = 10

  belongs_to :round
  belongs_to :player
  belongs_to :white_card, class_name: Card::White

  validate :ensure_within_hand_limit

  def self.current_for round_id, player_id
    joins(:white_card).where round_id: round_id, player_id: player_id
  end

  def self.picks_for round_id
    where round_id: round_id, player_pick: true
  end

  def reset_player_pick current_player_id
    hands = Hand.where round_id: self.round.id, player_id: current_player_id
    hands.each do |hand|
      hand.player_pick = false
      hand.save!
    end
  end

  private

  def ensure_within_hand_limit
    errors.add(:player, "has reached the maximum number of hands")  if player.hands.where(round: round).count == HAND_LIMIT_PER_PLAYER
  end

end
