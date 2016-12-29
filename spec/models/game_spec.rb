require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to have_many(:rounds).dependent(:destroy) }
  it { is_expected.to have_many(:scores).dependent(:destroy) }
  it { is_expected.to have_many(:players).through(:scores) }
  it { is_expected.to have_and_belong_to_many(:stacks) }

  it { is_expected.to validate_presence_of(:game_player_ids).on(:create) }
  it { is_expected.to validate_presence_of(:first_card_czar).on(:create) }

  describe "after create" do
    let!(:black_cards) { create_list :card, 3, :black }
    let(:players) { create_list :player, 3 }
    let(:first_card_czar) { players[0] }
    let(:game) { build :game, game_player_ids: players.map(&:id), first_card_czar: first_card_czar }

    it "add players to scores and starts first round" do
      game.save!
      expect(game.scores.count).to eq players.count
      expect(game.rounds.count).to be 1
      expect(game.rounds.first.card_czar).to eq first_card_czar
    end
  end
end
