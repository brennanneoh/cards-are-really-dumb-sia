require 'rails_helper'

RSpec.describe Card::Black do
  subject { Card::Black.new }
  it { is_expected.to validate_inclusion_of(:type).in_array [ Card::TYPES[:black] ] }
  it { is_expected.to validate_inclusion_of(:text_type).in_array(Card::Black::TEXT_TYPES.values) }

  describe "when text_type is `#{Card::Black::TEXT_TYPES[:fill_in_the_blanks]}`" do
    before { allow(subject).to receive(:is_fill_in_the_blanks?).and_return true }
    it { is_expected.to validate_presence_of(:blanks) }
    it { is_expected.to validate_numericality_of(:blanks).is_greater_than_or_equal_to(1).only_integer }
  end

  describe "when text_type is not `#{Card::Black::TEXT_TYPES[:fill_in_the_blanks]}`" do
    before { allow(subject).to receive(:is_fill_in_the_blanks?).and_return false }
    it { is_expected.not_to validate_presence_of(:blanks) }
    it { is_expected.not_to validate_numericality_of(:blanks).is_greater_than_or_equal_to(1).only_integer }
  end
end
