require 'rails_helper'

RSpec.describe Card, type: :model do
  subject { create :card }
  it { is_expected.to belong_to(:stack) }

  it { is_expected.to validate_presence_of(:stack) }
  it { is_expected.to validate_presence_of(:text) }
  it { is_expected.to validate_uniqueness_of(:text) }
  it { is_expected.to validate_inclusion_of(:card_type).in_array(Card::TYPES.values) }

  describe "pick random suit" do
    subject { Card.pick_random_suit }
    let!(:white_cards) { create_list :white_card, 2 }

    describe "when the black card is a question card" do
      let!(:black_card) { create :question_card }

      it "will select one white card for one question card" do
        expect(subject[:black_card]).to be_instance_of(Card::Black)
        expect(subject[:white_cards].count).to eq 1
      end
    end

    describe "when the black card is a fill in the blanks card" do
      let!(:black_card) { create :fill_in_the_blanks_card, text: '_ _' }

      it "will select multiple white cards for one question card" do
        expect(subject[:black_card]).to be_instance_of(Card::Black)
        expect(subject[:white_cards].count).to eq 2
      end
    end
  end
end
