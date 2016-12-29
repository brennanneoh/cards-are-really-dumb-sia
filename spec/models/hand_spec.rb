require 'rails_helper'

RSpec.describe Hand, type: :model do
  it { is_expected.to belong_to :round }
  it { is_expected.to belong_to :player }
  it { is_expected.to belong_to(:white_card).class_name(Card::White) }

  describe "when player has exceeded the card limit" do
    let(:round)      { create :round }
    let(:player)     { create :player }
    let!(:hands)     { create_list :hand, 10, round: round, player: player }
    let(:extra_hand) { build :hand, player: player, round: round }

    it "raises a hand limit error" do
      extra_hand.valid?
      expect(extra_hand.errors.full_messages).to include("Player has reached the maximum number of hands")
    end
  end
end
