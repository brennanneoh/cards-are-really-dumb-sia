class Hand < ApplicationRecord
  self.primary_keys = :round_id, :player_id

  belongs_to :round
  belongs_to :player
  belongs_to :card
end
