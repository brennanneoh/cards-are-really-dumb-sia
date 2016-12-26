class Game < ApplicationRecord
  has_many :rounds
  has_many :scores
  has_many :players, through: :scores
  belongs_to :stack
end
