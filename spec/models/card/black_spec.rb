require 'rails_helper'

RSpec.describe Card::Black do
  it { is_expected.to validate_inclusion_of(:type).in_array [ Card::TYPES[:black] ] }
  it { is_expected.to validate_inclusion_of(:text_type).in_array(Card::Black::TEXT_TYPES.values) }
end
