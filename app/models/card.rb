class Card < ApplicationRecord
  include CardAdmin

  TYPES = {
    black: 'black',
    white: 'white'
  }

  TEXT_TYPES = {
    question: 'question',
    fill_in_the_blanks: 'fill_in_the_blanks',
    answer: 'answer'
  }

  belongs_to :stack

  validates :stack, presence: true
  validates :text, presence: true, uniqueness: true
  validates :card_type, presence: true, inclusion: { in: TYPES.values }
  validates :text_type, presence: true, inclusion: { in: TEXT_TYPES.values }

  def self.pick_random_suit
    black_card = Card::Black.pick_one
    white_cards = Card::White.pick_random(black_card.blanks)
    { black_card: black_card, white_cards: white_cards }
  end

  def type_enum
    Card::TYPES.values
  end

  def text_type_enum
    Card::TEXT_TYPES.values
  end
end
