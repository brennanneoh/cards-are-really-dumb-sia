require 'rails_helper'

RSpec.describe Card, type: :model do
  it { is_expected.to validate_uniqueness_of(:text) }
  it { is_expected.to validate_inclusion_of(:type).in_array(Card::TYPES.values) }
  it { is_expected.to validate_inclusion_of(:text_type).in_array(Card::TEXT_TYPES.values) }
end
