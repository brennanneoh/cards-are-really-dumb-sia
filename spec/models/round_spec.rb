require 'rails_helper'

RSpec.describe Round, type: :model do
  it { is_expected.to belong_to :game }
  it { is_expected.to belong_to(:card_czar).class_name(Player) }
  it { is_expected.to belong_to(:black_card).class_name(Card::Black) }

  describe "before create" do
    let!(:black_cards) { create_list :card, 3, :black }
    let(:round) { build :round, black_card: nil }

    it "will pick a black card" do
      round.save
      expect(round.black_card).not_to be_nil
    end
  end
end
