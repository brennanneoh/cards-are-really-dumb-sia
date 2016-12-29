require 'rails_helper'

RSpec.describe Round, type: :model do
  it { is_expected.to belong_to :game }
  it { is_expected.to belong_to(:card_czar).class_name(Player) }
  it { is_expected.to belong_to(:black_card).class_name(Card::Black) }

  describe "when game has reached the round limit" do
    let(:rounds)      { create_list :round, Round::ROUND_LIMIT_PER_GAME }
    let(:game)        { create :game, rounds: rounds }
    let(:extra_round) { build :round, game: game }

    it "raises a round limit error" do
      extra_round.valid?
      expect(extra_round.errors.full_messages).to include("Game has reached the round limit")
    end
  end

  describe "after create" do
    let(:round) { create :round, hands: [] }

    it "will assign hands to players" do
      expect(round.hands).not_to be_nil
    end
  end
end
