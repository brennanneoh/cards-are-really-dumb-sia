require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:stack) { create :stack }
  subject { Card.new stack: stack }

  it { is_expected.to validate_presence_of(:stack) }
  it { is_expected.to validate_presence_of(:text) }
  it { is_expected.to validate_uniqueness_of(:text) }

  it { is_expected.to validate_inclusion_of(:type).in_array(Card::TYPES.values) }
  it { is_expected.to belong_to(:stack) }
end
