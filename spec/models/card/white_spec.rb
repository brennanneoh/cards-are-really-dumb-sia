require 'rails_helper'

RSpec.describe Card::White, type: :model do
  it { is_expected.to validate_inclusion_of(:card_type).in_array [ Card::TYPES[:white] ] }
  it { is_expected.to validate_inclusion_of(:text_type).in_array(Card::White::TEXT_TYPES.values) }
end
