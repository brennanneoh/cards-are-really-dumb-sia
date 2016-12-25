class Game < ApplicationRecord
  has_many :rounds
  has_many :scores
  has_many :players, through: :scores
end
