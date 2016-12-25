require 'rails_helper'

RSpec.describe Round, type: :model do
  it { is_expected.to belong_to :game }
  it { is_expected.to belong_to(:card_czar).class_name(Player) }
  it { is_expected.to belong_to(:black_card).class_name(Card::Black) }
end
