class Card < ApplicationRecord
  TYPES = {
    black: 'black',
    white: 'white'
  }

  TEXT_TYPES = {
    question: 'question',
    fill_in_the_blanks: 'fill_in_the_blanks',
    answer: 'answer'
  }

  validates :text, uniqueness: true
  validates :type, inclusion: { in: TYPES.values }
  validates :text_type, inclusion: { in: TEXT_TYPES.values }
end
