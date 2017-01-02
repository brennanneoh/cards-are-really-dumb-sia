class Game < ApplicationRecord
  has_many :rounds, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_many :players, through: :scores
  has_and_belongs_to_many :stacks

  attr_accessor :game_player_ids
  attr_accessor :first_card_czar

  after_create :add_players_to_scores
  after_create :start_first_round

  validates :game_player_ids, presence: true, on: :create
  validates :first_card_czar, presence: true, on: :create

  def round_number
    rounds.count
  end

  def current_round
    rounds.order(created_at: :desc).limit(1).first
  end

  private

  def add_players_to_scores
    self.game_player_ids.reject { |player_id| player_id == '' }.each do |pid|
      Score.create game_id: self.id, player_id: pid
    end
  end

  def start_first_round
    Round.create game_id: self.id, card_czar: first_card_czar, black_card: Card::Black.pick_one
  end
end
