require 'rails_helper'

RSpec.describe Card::Black do
  it { is_expected.to validate_inclusion_of(:card_type).in_array [ Card::TYPES[:black] ] }
  it { is_expected.to validate_inclusion_of(:text_type).in_array Card::Black::TEXT_TYPES }
  it { is_expected.to validate_presence_of(:blanks) }
  it { is_expected.to validate_numericality_of(:blanks).only_integer.is_greater_than_or_equal_to(1) }

  describe "count and record blanks" do
    let(:blanks_card) { build :fill_in_the_blanks_card, text: '_ _' }
    let(:question_card) { build :question_card, text: '_ _' }

    it "should record the number of blanks in a fill in the blanks card" do
      blanks_card.save
      expect(blanks_card.blanks).to eq 2
    end

    it "should not count and record blanks for a question card" do
      question_card.save
      expect(question_card.blanks).to eq 1
    end
  end
end
