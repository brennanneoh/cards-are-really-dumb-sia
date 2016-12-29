class Game < ApplicationRecord
  has_many :rounds, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_many :players, through: :scores
  has_and_belongs_to_many :stacks

  attr_accessor :game_player_ids
  attr_accessor :first_card_czar

  after_create :add_players_to_scores
  after_create :start_first_round

  private

  def add_players_to_scores
    self.game_player_ids.reject { |id| id == '' }.each do |pid|
      Score.create game_id: self.id, player_id: pid
    end
  end

  def start_first_round
    Round.create game_id: self.id, card_czar: first_card_czar
  end
end
