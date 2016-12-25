class Hand < ApplicationRecord
  belongs_to :round
  belongs_to :player
  belongs_to :card
end
